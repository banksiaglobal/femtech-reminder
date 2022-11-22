Class FTR.Production.Service.TelegramIn Extends Ens.BusinessService
{

Property Adapter As EnsLib.HTTP.InboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

Parameter HandleCorsRequest = 1;

/*
bg-mn:
	receipt of incoming HTTP requests
*/
Method OnProcessInput(pInput As %Stream.GlobalCharacter, Output pOutput As FTR.Production.Message.TelegramResponse) As %Status
{
	try {
		// send input data to TelegramRouter for further transformation 
		set request = ##class(FTR.Production.Message.RouterRequest).%New()
		set request.InterMessage = {}.%FromJSON(pInput)
		set request.User = ##class(FTR.Model.Patient).CheckUser(request.InterMessage.message.from.id) 
		set tSC = ..SendRequestAsync("FTR.Production.Process.TelegramRouter", request)	    
	 }
	catch ex {
		set tSC = ex.AsStatus()
	}
	return $$$OK
}

}
