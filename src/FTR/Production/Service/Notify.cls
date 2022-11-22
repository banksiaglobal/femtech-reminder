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

    Quit tSC
}

/*
bg-mn: 
	generation appointment for women to collect test data
*/
Method ImitateAppointment() As %Status
{
	
	set tSC = $$$OK
	Try {
		// get all patient from FHIR-server
		set request = ##class(HS.FHIRServer.Interop.Request).%New()
		set request.Request.RequestMethod = "GET"
		set request.Request.RequestPath = "/Patient"
		set tSC = ..SendRequestSync("FTR.Production.Operation.FHIROut",request,.response) 
		
		// get data from response
		set Patients = {}.%FromJSON(##class(HS.SDA3.QuickStream).%OpenId(response.QuickStreamId))
		
		// look for female patient
		do{
			// generate index of patient in array response
			set randomNumPatient = $RANDOM(Patients.entry.%Size()) 
			// get 
			set Patient = Patients.entry.%Get(randomNumPatient)
		}while(Patient.resource.gender = "male")

		// generate recommendation
		set listRecommend = ["Add vitamins and menerals to the diet","Normalizing sleep","Include daily sports activity","Increase water intake"]
		set randomNumRec = $RANDOM(listRecommend.%Size())

		// set now date in necessary format
		set dt = ##class(%Library.UTC).NowUTC()
		set dt = $TRANSLATE(dt," ","T")_"+00:00"


		// make up the request body
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

		// create stream
		set stream = ##class(HS.SDA3.QuickStream).%New()
		set jsonCharStream = ##class(%Stream.GlobalCharacter).%New()
		// add request body to stream
		do jsonCharStream.Write(body.%ToJSON())
		
		// save stream 
		do stream.CopyFromAndSave(jsonCharStream)
		s sc = stream.%Save()

		// create POST request object for FHIR
		set requestAppointment = ##class(HS.FHIRServer.Interop.Request).%New()
		set requestAppointment.Request.RequestMethod = "POST"
		set requestAppointment.Request.RequestPath = "/Appointment"
		set requestAppointment.Request.RequestFormatCode = "JSON"
		set requestAppointment.QuickStreamId = stream.%Id()
		
		// send synchronous request to FHIR 
		set tSC = ..SendRequestSync("FTR.Production.Operation.FHIROut",requestAppointment,.responseAppointment) 

	}
	Catch ex {
		Set tSC=ex.AsStatus()
	}
	
	
	q tSC
}

}
