/// Check if patient exists
Class FTR.Production.Process.NotifyPatient Extends Ens.BusinessProcess
{

/// Receive to transform or transformed
/// route
Method OnRequest(pRequest As FTR.Production.Message.NotifyPatientRequest, Output pResponse As FTR.Production.Message.NotifyPatientResponse) As %Status
{
	Set tSC = $$$OK
	// Get cart ofFHIR
	Set telegramId = pRequest.TelegramId

	&sql(select FhirId into :PatientId from FTR_Model.Patient where TelegramID = :telegramId)
	Set tRequest = ##class(HS.FHIRServer.Interop.Request).%New()
	Set tRequest.Request.RequestMethod = "GET"
	Set tRequest.Request.RequestPath = "/Patient/"_PatientId
	set tSC = ..SendRequestSync("FTR.Production.Operation.FHIROut",tRequest,.tResponse) 
	
	Set PatientCard = {}.%FromJSON(##class(HS.SDA3.QuickStream).%OpenId(tResponse.QuickStreamId))
	//$$$TRACE(PatientCard.id)
	//$$$TRACE(PatientCard.text.div)
	//$$$TRACE(PatientCard.%ToJSON())

	Set tRequest = ##class(FTR.Production.Message.TelegramOutRequest).%New()
	Set tRequest.ChatId  = telegramId
	Set tRequest.Text  = ..CreateNotification(telegramId,PatientCard)
	set tSC = ..SendRequestSync("Operation.TelegramOut",tRequest,.tResponse) 
	//Set ^zAK = tResponse
		
	Set pResponse = ##class(FTR.Production.Message.NotifyPatientResponse).%New()
	Set pResponse.IsSuccess = 1

	Quit tSC
}

// 1181857861

ClassMethod CreateNotification(telegramId, PatientCard) As %String
{
	&sql(select ID into :patientId from FTR_Model.Patient where TelegramID = :telegramId)
	Quit:SQLCODE'=0 ""
	Set birthDate = PatientCard.birthDate
	Set age = $PIECE($zdate(+$Horolog), "/", 3) - $PIECE(birthDate, "-")

	//Set csql = "select ID, Period, NotificationText from FTR_Model_Recommendation.Age where ? > AgeFrom and ? < AgeUpTo"
	Set csql = "select * from FTR_Model_Recommendation.Age where (AgeFrom is null or AgeFrom < ?) and (AgeUpTo is null or AgeUpTo > ?)"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	If ($$$ISOK(tcStatus)) { 
		Set tcResult = tcStatement.%Execute(age, age)
		If (tcResult.%SQLCODE=0) {	
			While tcResult.%Next() {	
				&sql(select NotifyDate into :date from FTR_Model.Notification where :tcResult.ID = Recommendation order by NotifyDate desc)
				set difMonth = $PIECE($zdate(+$Horolog), "/") - $PIECE($zdate(date), "/")
				set difYear = $PIECE($zdate(+$Horolog), "/",3) - $PIECE($zdate(date), "/",3)			
				set dif = difMonth + difYear*12
				If (SQLCODE=0)||(dif<tcResult.Period)||(tcResult.Period = ""){					
					Continue
				} else
					{	
						set recommendation = tcResult.NotificationText
						Set Notification = ##class(FTR.Model.Notification).%New()
						Do Notification.PatientSetObjectId(patientId)
						Do Notification.RecommendationSetObjectId(tcResult.ID)
						Do Notification.%Save()
						return recommendation					
					}
			}				
		}
	}
	//return "no recommendation for you"
	q ""
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
