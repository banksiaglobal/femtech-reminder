Class FTR.Production.Service.Notify Extends Ens.BusinessService
{

Property Adapter As Ens.InboundAdapter;

Parameter ADAPTER = "Ens.InboundAdapter";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
	Set tSC = $$$OK
    Set csql = "select TelegramID from FTR_Model.Patient"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	If ($$$ISOK(tcStatus)) { 
		Set tcResult = tcStatement.%Execute()
		If (tcResult.%SQLCODE=0) {
			While tcResult.%Next() {
                Set tRequest = ##class(FTR.Production.Message.NotifyPatientRequest).%New()
	            Set tRequest.TelegramId  = tcResult.TelegramID
	            set tSC = ..SendRequestSync("FTR.Production.Process.NotifyPatient",tRequest,.tResponse) 				
			}
		}
	}
    //set ..%WaitForNextCallInterval=1

	set tSC = ..ImitateApointment()
    Quit tSC
}

Method ImitateApointment() As %Status
{
	write !, "start"
	set tSC = $$$OK
	Try {
		set request = ##class(HS.FHIRServer.Interop.Request).%New()
		set request.Request.Method = "GET"
		set request.Request.RequestPath = "/Patient"
		set tSC = ..SendRequestSync("FTR.Production.Operation.FHIROut",request,.response) 

		set Patients = {}.%FromJSON(##class(HS.SDA3.QuickStream).%OpenId(response.QuickStreamId))
		
		do{
			set randomNumPatient = $RANDOM(Patients.total) 
			set Patient = Patients.entry.%Get(randomNumPatient)
			write !, Patient.resource.id, Patient.resource.gender
		}while(Patient.resource.gender = "male")

		set listRecommend = ["Add vitamins and menerals to the diet","Normalizing sleep","Include daily sports activity","Increase water intake"]
		set randomNumRec = $RANDOM(listRecommend.%Size())

		set dt = ##class(%Library.UTC).NowUTC()

		set body = {}
		set body.resourceType = "Appointment"
		set body.status = "booked"
		set body.start = dt
		set body.end = dt
		set body.participant = []

		set actor = {}
		set actor.reference = "Patient/"_Patient.resource.id
		set actor.display = listRecommend.%Get(randomNumRec)

		set body.participant."0" = {}
		set body.participant."0".actor = actor
		set body.participant."0".status = "accepted"

		set request.Request.Method = "POST"
		set request.Request.RequestPath = "/Appointment"
		set request.Request.Json = body.%ToJSON()

		set tSC = ..SendRequestAsync("FTR.Production.Operation.FHIROut",request) 

	}
	Catch ex {
		Set tSC=ex.AsStatus()
	}
	
	/// send custom apointment to custom patient
	
	q tSC
}

}
