Class FTR.Production.Process.TelegramRouter Extends Ens.BusinessProcess
{

Method OnResponse() As %Status
{
    Return $$$OK
}

/*
bg-mn:
    decomposition of incoming message and formation of response to user
*/
Method OnRequest(pRequest As FTR.Production.Message.RouterRequest, Output pResponse As Ens.Response) As %Status
{
    // set defoult message for request to TelegramOut
    set message = "Sorry, I'm lost.%0APlease, enter the correct command."


    // get nessesary data from input massage
    set text = pRequest.InterMessage.message.text
    set User = pRequest.User

    // if input command is next_notification and user is registered 
    if ( text = "/next_notification") && (User.LastMessage = "/after"){
        // send recomendation for user 
        do ..CallNotification(User.TelegramID, text)
        quit $$$OK
    }
    // if input command is stop
    elseif (text = "/stop") {
        // user log out from reminder
        set message = ..StopNotification(User.%Id())
        // sent message that user is logged off
        do ..SendOutMessage(User.TelegramID, message)
        quit $$$OK
    }

    // if input command is start and user not yet registered in the system
    
    elseif ((text = "/start") && (User.LastMessage = "")) {
        set message = "Welcome, if you want to registrating in our reminder, please, enter /registration."
		set User.LastMessage = text
    }
    // if user not yet registered in the system
    elseif ((User.LastMessage = "")){
        set message = "Hello, if you want to start using our bot, click /start."
    }
    // if user wonna to register in the system
    elseif ((text = "/registration") && ((User.LastMessage = "/start") || (User.LastMessage = ""))){
		set message =  "Please, enter your full name and birthday in the format(without further punctuation):%0AFirstName LastName YYYY-MM-DD"
		set User.LastMessage = text
	}
    // incoming data message for registration 
    elseif (User.LastMessage = "/registration"){
		set message = ..Registration(User, text)
	}

    // if input command is help
    elseif (text = "/help"){
		set message = "Settings of BG-FHIR bot:%0A/start - Initiation of work with bot;%0A/stop - log off user from system and stop notification;%0A/help - Get all commands of the bot;%0A/registration - Initialization of the regression process;%0A/next_notification - Send the next notification."
	}
    
    Try {
        // save user's data
        set tSC =  User.%Save()
    }
    Catch ex {
        Set tSC=ex.AsStatus()
        return tSC
    }
    // send a reply message to the user in Telegram
    do ..SendOutMessage(User.TelegramID, message)
    return tSC
}

/*
bg-mn:
    stop send notifications and remove the user from the system
*/
Method StopNotification(userId As %String) As %String
{
    Try {
            // remove the user from the system
            do ##class(FTR.Model.Patient).%DeleteId(userId)
            set mes = "Bot work has been suspended.%0APlease, go through the regestaration again and get a notification."
        }
    Catch ex {
            Set tSC=ex.AsStatus()
            set mes = "Something went wrong, maybe you're not registered in our system."
        }
    return mes
}

/*
bg-mn:
    call process that send recommendation to Telegram
*/
Method CallNotification(telegramId As %String, text As %String) As %Status
{
    Try {
        set outRequest = ##class(FTR.Production.Message.NotifyPatientRequest).%New()
        set outRequest.TelegramId = telegramId
        set outRequest.Message = text
        set tSC = ..SendRequestAsync("FTR.Production.Process.NotifyPatient", outRequest)    
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    return tSC
}

/*
bg-mn:
    send reply message
*/
Method SendOutMessage(telegramID As %String, textOut As %String)
{
    set outRequest=##class(FTR.Production.Message.TelegramOutRequest).%New()
    set outRequest.Text = textOut
    set outRequest.ChatId=telegramID
    set tSC = ..SendRequestAsync("Operation.TelegramOut",outRequest)
}

/*
bg-mn:
    register user in the system
*/
Method Registration(User As FTR.Model.Patient, mes As %String) As %String
{
    // split input message 
	set User.Name = $PIECE(mes, " ")
	set User.LastName = $PIECE(mes, " ", 2)
	set Date = $PIECE(mes, " ", 3)

    // if input data is correct
	if (Date'="") && ($length(Date,"-")=3) && (User.LastName '= "") {

        // check patient data in FHIR-server
		set request = ##class(FTR.Production.Message.CheckPatientRequest).%New()
		set request.Name = User.Name
		set tSC = ..SendRequestSync("FTR.Process.CheckPatient",request, .response)
		
        // get patient data
		set dataPatient = response.Patient.entry.%Get(0).resource
		
        // if patient data found in FHIR, patient is woman, and input birthday and birthday from patient card are equals
		if (response.IsPatientFound) && (dataPatient.gender = "female") && ($ZDATEH(dataPatient.birthDate,3) = $ZDATEH(Date,3)) {

            // fill in user data 
			set User.FhirId = dataPatient.id
			set User.DOB = $ZDATEH(dataPatient.birthDate,3) 
			set User.LastMessage = "/after"
			quit "Registration was successful.%0APlease, expect recommendatory notices."
		} 
	}
	
	quit "The user is not found, please, try again."
	
	return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
