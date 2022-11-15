Class FTR.Production.Process.TelegramRouter Extends Ens.BusinessProcess
{

/// Description
Method OnResponse() As %Status
{
    Set sc = $$$OK
    // do something
    Return sc
}

Method OnRequest(pRequest As FTR.Production.Message.RouterRequest, Output pResponse As Ens.Response) As %Status
{
   
    set message = "Sorry, I'm lost."
    set text = pRequest.InterMessage.message.text
    set User = pRequest.User

    if ( text = "/next_notification") && (User.LastMessage = "/after"){
        do ..CallNotification(User.TelegramID)
        quit $$$OK
    }
    elseif (text = "/stop") {
        set message = ..StopNotification(User.%Id())
        do ..SendOutMessage(User.TelegramID, message)
        quit $$$OK
    }
    elseif ((text = "/start") && (User.LastMessage = "")) {
        set message = "Welcome, if you want to registrating in our reminder please enter /registration"
		set User.LastMessage = text
    }
    elseif ((User.LastMessage = "")){
        set message = "Hello, if you want to start using our bot, click /start"
    }
    elseif ((text = "/registration") && (User.LastMessage = "/start")){
		set message =  "Please, enter your full name and birthday in the fromat(without further punctuation):%0AFirstName LastName YYYY-MM-DD"
		set User.LastMessage = text
	}
    elseif (User.LastMessage = "/registration"){
		set message = ..Registration(User, text)
	}
    elseif (text = "/help"){
		set message = "Sattings of BG-FHIR bot:%0A/start - Running the notification;%0A/stop - Stop sending messages;%0A/help - Get all commands of the bot,%0A/registration - Registration user in systems FHIR,%0A/next_notification - Send the next notification"
	}
    
    Try {    
        set tSC =  User.%Save()
    }
    Catch ex {
        Set tSC=ex.AsStatus()
        return tSC
    }
    do ..SendOutMessage(User.TelegramID, message)
    return tSC
}

Method StopNotification(UserId As %String) As %String
{
    Try {
            do ##class(FTR.Model.Patient).%DeleteId(UserId)
            set mes = "Bot work has been suspended%0APlese, go through the regression again to get notification"
        }
    Catch ex {
            Set tSC=ex.AsStatus()
            set mes = "Something went wrong, maybe you're not registered in our system"
        }
    return mes
}

Method CallNotification(TelegramId) As %Status
{
    Try {
        set outRequest = ##class(FTR.Production.Message.NotifyPatientRequest).%New()
        set outRequest.TelegramId = TelegramId
        set tSC = ..SendRequestAsync("FTR.Production.Process.NotifyPatient", outRequest)    
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    return tSC
}

Method SendOutMessage(TelegramID As %String, TextOut As %String)
{
    set outRequest=##class(FTR.Production.Message.TelegramOutRequest).%New()
    set outRequest.Text = TextOut
    set outRequest.ChatId=TelegramID
    set tSC = ..SendRequestAsync("Operation.TelegramOut",outRequest)
}

Method Registration(user As FTR.Model.Patient, mes As %String) As %String
{
	set user.Name = $PIECE(mes, " ")
	set user.LastName = $PIECE(mes, " ", 2)
	set Date = $PIECE(mes, " ", 3)
	if (Date'="") && ($length(Date,"-")=3) && (user.LastName '= "") {
	
		set request = ##class(FTR.Production.Message.CheckPatientRequest).%New()
		set request.Name = user.Name
		set tSC = ..SendRequestSync("FTR.Process.CheckPatient",request, .response)
		
		set dataPatient = response.Patient.entry.%Get(0).resource
		
		$$$TRACE("after get user's data")
		if (response.IsPatientFound) && (dataPatient.gender = "female") && ($ZDATEH(dataPatient.birthDate,3) = $ZDATEH(Date,3)) {
			$$$TRACE(dataPatient.id)
			set user.FhirId = dataPatient.id
			set user.DOB = $ZDATEH(dataPatient.birthDate,3) 
			set user.LastMessage = "/after"
			quit "Registration was successful"
		} 
	}
	
	quit "User is not found, please, try again"
	
	return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
