Class FTR.Production.Process.NotifyPatient Extends Ens.BusinessProcess
{

Method OnResponse() As %Status
{
	Set sc = $$$OK
	Return sc
}

// mg: generating a response message

Method OnRequest(pRequest As FTR.Production.Message.NotifyPatientRequest, Output pResponse As FTR.Production.Message.NotifyPatientResponse) As %Status
{
	Set tSC = $$$OK
	Set telegramId = pRequest.TelegramId

	&sql(select ID, FhirId into :patientId, :FHIRId from FTR_Model.Patient where TelegramID = :telegramId and LastMessage = '/after')
	Quit:SQLCODE'=0 $$$OK
	
	do ..CheckAppointment(FHIRId, telegramId)

	set pregWeek = ..CheckPregnancy(FHIRId)
	Set tRequest = ##class(FTR.Production.Message.TelegramOutRequest).%New()
	Set tRequest.ChatId  = telegramId	
	if (pregWeek =-1) {
		Set PatientCard = ..GetCard(FHIRId)
		Set tRequest.Text  = "You are advised: "_..CreateNotificationAge(patientId,PatientCard)
		} else{		
		Set tRequest.Text  = ..CreateNotificationPregnancy(pregWeek, patientId)
	}
	if ((tRequest.Text = "") || (tRequest.Text  = "You are advised: ")) && (pRequest.Message = "/next_notification")  {
		set tRequest.Text = "no recommendation for you"
	}
	set tSC = ..SendRequestSync("Operation.TelegramOut",tRequest, .tResponse) 
	Set pResponse = ##class(FTR.Production.Message.NotifyPatientResponse).%New()
	Set pResponse.IsSuccess = 1

	Quit $$$OK
}

/// mg: receiving a patient card from FHIR
Method GetCard(PatientId) As %Library.DynamicObject
{
	Set tRequest = ##class(HS.FHIRServer.Interop.Request).%New()
	Set tRequest.Request.RequestMethod = "GET"
	Set tRequest.Request.RequestPath = "/Patient/"_PatientId
	set tSC = ..SendRequestSync("FTR.Production.Operation.FHIROut",tRequest,.tResponse) 
	Set PatientCard = {}.%FromJSON(##class(HS.SDA3.QuickStream).%OpenId(tResponse.QuickStreamId))
	return PatientCard
}

/* bg-mg/mn: 
	сheck if the patient has a pregnancy test
		input: fhirId - id of patient by FHIR
		return: week of pregnancy or -1 if incorrect
*/
Method CheckPregnancy(FhirId As %String) As %Integer
{

	// create request for get Observation
	Set tRequest = ##class(HS.FHIRServer.Interop.Request).%New()
	Set tRequest.Request.RequestMethod = "GET"
	Set tRequest.Request.RequestPath = "/Observation?code=LA15173-0&patient="_FhirId

	// send sync request to FHIR
	set tSC = ..SendRequestSync("FTR.Production.Operation.FHIROut",tRequest,.tResponse) 

	// get a object from an input stream 
	set res = {}.%FromJSON(##class(HS.SDA3.QuickStream).%OpenId(tResponse.QuickStreamId))

	// if response has observation data
	if (res.total '= 0){
		// calculation of pregnancy week
		q ..CalculatePregnancyWeek(res.entry.%Get(0).resource.valueDateTime)
	}
	q -1
}

/*

bg-mn:
	check the appointment for patient
	input: fhirId - id of patient by FHIR
		   telegramID - id of patient by Telegram
*/
Method CheckAppointment(fhirId As %String, telegramID As %String) As %Status
{
	Set tSC = $$$OK

	// create request 
	Set tRequest = ##class(HS.FHIRServer.Interop.Request).%New()
	Set tRequest.Request.RequestMethod = "GET"
	Set tRequest.Request.RequestPath = "/Appointment?patient="_fhirId
	
	// send request to FHIR-server
	set tSC = ..SendRequestSync("FTR.Production.Operation.FHIROut",tRequest,.tResponse) 

	// get a object from an input stream 
	set res = {}.%FromJSON(##class(HS.SDA3.QuickStream).%OpenId(tResponse.QuickStreamId))
	// if the incoming message has data 
	if (res.total '= 0){

		//appointment cycle
		 for i = 0:1:res.entry.%Size()-1 {
			set data = res.entry.%Get(i)

			// get date from appointment 
			set dt = $zdateh($PIECE(data.resource.start, "T"), 3)
			
			// get yesterday
			set yesterday = $zdateh(##class(%Library.Utility).Date(), 5)-1
			
			// if the appointment was received yesterday, send a recommendation by telegram to the patient 
			if (dt = yesterday){
				Set tRequest = ##class(FTR.Production.Message.TelegramOutRequest).%New()
				Set tRequest.ChatId  = telegramID
				set tRequest.Text = "Doctor’s recommendation after the visit: "_data.resource.participant.%Get(0).actor.display
				set tSC = ..SendRequestAsync("Operation.TelegramOut",tRequest) 
			}
			
		}
	}
	Return tSC
}

// mg: generation of a new notification, if such a recommendation has not yet been sent within the period of this recommendation

// mg: recommendation for pregnancy

ClassMethod CreateNotificationPregnancy(pregWeek, patientId) As %String
{
	Set csql = "select * from FTR_Model_Recommendation.Pregnancy where Week = ?"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	If ($$$ISOK(tcStatus)) { 
		Set tcResult = tcStatement.%Execute(pregWeek)
		If (tcResult.%SQLCODE=0) {							
			While tcResult.%Next() {								
				&sql(select * from FTR_Model.Notification where Recommendation = :tcResult.ID and Patient = :patientId)
				If (SQLCODE=0){					
					Continue					
					} else
					{	
						Set Notification = ##class(FTR.Model.Notification).%New()
						Do Notification.PatientSetObjectId(patientId)
						Do Notification.RecommendationSetObjectId(tcResult.ID)
						Set status =  Notification.%Save()
						return tcResult.NotificationText
					}
			}
		}
	}
	q ""
}

// mg: generation of a new notification, if such a recommendation has not yet been sent within the period of this recommendation

// mg: recommendation for different age groups

ClassMethod CreateNotificationAge(patientId, PatientCard) As %String
{
	Set birthDate = PatientCard.birthDate
	Set age = $PIECE($zdate(+$Horolog), "/", 3) - $PIECE(birthDate, "-")
	Set csql = "select * from FTR_Model_Recommendation.Age where (AgeFrom is null or AgeFrom < ?) and (AgeUpTo is null or AgeUpTo > ?)"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	If ($$$ISOK(tcStatus)) { 
		Set tcResult = tcStatement.%Execute(age, age)
		If (tcResult.%SQLCODE=0) {	
			While tcResult.%Next() {
				&sql(select NotifyDate into :date from FTR_Model.Notification where :tcResult.ID = Recommendation and Patient = :patientId order by NotifyDate desc)
				set difMonth = $PIECE($zdate(+$Horolog), "/") - $PIECE($zdate(date), "/")
				set difYear = $PIECE($zdate(+$Horolog), "/",3) - $PIECE($zdate(date), "/",3)
				set dif = difMonth + difYear*12
				If (SQLCODE=0)||(dif<tcResult.Period)||(tcResult.Period = ""){
					Continue
					} else
					{
						Set recommendation = tcResult.NotificationText
						Set Notification = ##class(FTR.Model.Notification).%New()
						Do Notification.PatientSetObjectId(patientId)
						Do Notification.RecommendationSetObjectId(tcResult.ID)
						Do Notification.%Save()
						return recommendation
				}
			}
		}
	}
	q ""
}

/* 
bg-mn: 
	calculation of pregnancy week
 		input: edd - the pregnancy expected delivery date
		return: week of pregnancy or -1 if incorrect
*/
ClassMethod CalculatePregnancyWeek(edd As %String) As %Integer
{
	// get now date to internal format
	set now = $zdateh(##class(%Library.Utility).Date(), 5)

	// get pregnancy expected delivery date to internal format
	set edd = $zdateh(edd, 3)

	// if the date hasn't passed 
	if now < edd {
		return 40 - ($NORMALIZE((edd - now) / 7,0))
		}
	return -1
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
