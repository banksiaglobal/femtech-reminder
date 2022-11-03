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
		
		Set User = ##class(FTR.Model.User).CheckUser(json.message.from.id)

		if (json.message.text="/stop")  {
			set outRequest=##class(FTR.Production.Operation.TelegramOutStop).%New()
		} else {
			set outRequest=##class(FTR.Production.Operation.TelegramOutRequest).%New()
			set outRequest.ChatId=json.message.chat.id
			set outRequest.Text = ..RouterCall(json.message.text, User)
			//set outRequest.Text = User.LastMessage 
			//$$$TRACE(User.LastMessage)
		}
		set tSC = ..SendRequestAsync("Operation.TelegramOut",outRequest)

    	//set pOutput.JSONResponse = "qwerty"	 
		$$$ThrowOnError(tSC)
	    
	 }
	catch ex {
		$$$TRACE(ex.DisplayString())
		set tSC = ex.AsStatus()
	}
	return $$$OK
}

ClassMethod RouterCall(text As %String, user As FTR.Model.User) As %String
{
	if ((text = "/start") && (user.LastMessage = "")) {
		set q = "Welcome, if you want to registrating in our reminder please enter /registration"
		set user.LastMessage = text
	}
	elseif ((text = "/registration") && (user.LastMessage = "/start")){
		set q =  "Please, enter your full name and birthday if fromat: FirstName LastName DD/MM/YYYY"
		set user.LastMessage = text
	}
	elseif (user.LastMessage = "/registration"){
		do ..Registration(user, text)
		set user.LastMessage = "/after"
		set q = "Success"
	}
	elseif (text = "/help"){
		set q = "Help"
	}
	try{
		do user.%Save()
	}
	catch ex {
		set tSC = ex.AsStatus()
	}
	
	//Set q = $CASE(text, "/start": "Welcome", "/registration": "Write your name, please", "/help":"This is instruction", :"I am lost")
	Return q
}

ClassMethod Registration(user As FTR.Production.User, mes As %String) As %Status
{
	set user.Name = $PIECE(mes, " ")
	set user.LastName = $PIECE(mes, " ", 2)
	set user.Date = $PIECE(mes, " ", 3)

	return $$$OK
}

}
