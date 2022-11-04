Class FTR.Production.Service.TelegramIn Extends Ens.BusinessService
{

Property Adapter As EnsLib.HTTP.InboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

Parameter HandleCorsRequest = 1;

// 

Method OnProcessInput(pInput As %Stream.GlobalCharacter, Output pOutput As FTR.Production.Message.TelegramResponse) As %Status
{
	try {		
		$$$TRACE("hello2")
		set json = {}.%FromJSON(pInput)
		$$$TRACE(json.%ToJSON())
		
		Set User = ##class(FTR.Model.Patient).CheckUser(json.message.from.id)
		//if (json.message.text="/notification") {
		//	set 
		//}
		if (json.message.text="/stop")  {
			set outRequest=##class(FTR.Production.Operation.TelegramOutStop).%New()
		} else {
			set outRequest=##class(FTR.Production.Operation.TelegramOutRequest).%New()
			set outRequest.ChatId=json.message.chat.id
			set outRequest.Text = ..RouterCall(json.message.text, User)
		}
		set tSC = ..SendRequestAsync("Operation.TelegramOut",outRequest) 
		$$$ThrowOnError(tSC)
	    
	 }
	catch ex {
		$$$TRACE(ex.DisplayString())
		set tSC = ex.AsStatus()
	}
	return $$$OK
}

Method RouterCall(text As %String, user As FTR.Model.Patient) As %String
{
	if ((text = "/start") && (user.LastMessage = "")) {
		set message = "Welcome, if you want to registrating in our reminder please enter /registration"
		set user.LastMessage = text
	}
	elseif ((text = "/registration") && (user.LastMessage = "/start")){
		set message =  "Please, enter your full name and birthday in the fromat: FirstName LastName DD/MM/YYYY"
		set user.LastMessage = text
	}
	elseif (user.LastMessage = "/registration"){
		set message = ..Registration(user, text)
	}
	elseif (text = "/help"){
		set message = "Sattings of BG-FHIR bot:%0A/start - Running the notification;%0A/stop - Stop sending messages;%0A/help - Get all commands of the bot,%0A/registration - Registration user in systems FHIR"
	}
	elseif ((text = "/start") && (user.LastMessage = "/stop")) {
		set message = "Running the notification again"
	}
	
	try{
		do user.%Save()
	}
	catch ex {
		set tSC = ex.AsStatus()
	}
	
	Return message
}

Method Registration(user As FTR.Model.Patient, mes As %String) As %String
{
	set user.Name = $PIECE(mes, " ")
	set user.LastName = $PIECE(mes, " ", 2)
	set Date = $PIECE(mes, " ", 3)
	if (Date'="") && ($length(Date,"/")=3) set user.DOB = $ZDATE(Date,4)
	
	set request = ##class(FTR.Production.Message.CheckPatientRequest).%New()
	set request.Name = user.Name
	set tSC = ..SendRequestSync("FTR.Process.CheckPatient",request, .response)
	if response.IsPatientFound {
		set user.LastMessage = "/after"
		quit "Registration was successful"
	}
	quit "User is not found, please, try again"
	

	return $$$OK
}

}
