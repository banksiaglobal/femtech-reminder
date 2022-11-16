# FemTech Reminder for InterSystems FHIR Contest 

## Introduction

**This project is still work-in-progress, we will present final version before contest cut-off date**

Today in the modern society and fast life, women priorities include not just caring about family and kids, but also building business and career, leaving no time to care about her health and regularly checkups, often not suspecting about developing health issues.

According to research by leading healthcare organizations, early diagnostics and observation may significantly reduce risks of severe women health problems.

Our project helps to solve this problem and allows the user to receive reminders about regular visits to the clinic. We have developed notification system which connects to FHIR data storage, analyses patient's data, and gives a prompt notification to visit a doctor. 


## Summary

This system is a set of components: the server part based on InterSystems IRIS for Health, a cloud-based FHIR server, and two client parts: - telegram bot-reminder and Web GUI.
The server part analyses patient's data and send a notification to visit a doctor or to do laboratory examinations via the telegram bot. Administrators use web-based GUI interface to configure recommendations.


## Map mind

When brainstorming the solution to apply for this contest, our team came up with the following possible use cases for a female health reminder application, and divided them into three levels: top level (blue) describes actors (WHO?), middle layer (yellow) describes use cases (WHAT?) and third level (pink) describes tasks (HOW?)

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/mapMind.png)


## Application Layout

* you go to GUI
* create a new recommendation
* go into the telegram bot
* enter your data
* get a recomendations*/


## Online Demo

[bot](https://t.me/bg_fhir_bot)


## Features

* configuration of age-based recommendations;
* sending age-based, diagnosis-based notifications and planned appointments;
* list of recommendations from WHO;
* self-registration of end users in the telegram bot;
* binding users to their medical records at FHIR server;
* view registered patients and notification log via GUI-interface.


## Recommendation

Read related documentations: [fhir](https://www.hl7.org/fhir/)


# Description of system

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/descriptionOfSystem.png)

* ## Backend

The server part contains the following business components

### Business Services:
* TelegramIn - receive messages from telegram bot
* Notify - self-schedule service to check for patient notifications

### Business Processes:
* CheckPatient - check presence of user’s medical records on FHIR server;
* Alert - handle errors and alerts in IRIS production;
* NotifyPatient - determine recommendations for user notification;
* TelegramRouter - route incoming messages from telegram-bot and send commands to another process/operation.

### Business Operations:
* OperationFHIROut - send FHIR requests;
* TelegramOut - send messages to a telegram bot.

### How to run

#### Docker deployment from github
[todo]

#### ZPM deployment
[todo]

#### Setup FHIR Server

1. Sign up in Cloud Portal on portal.live.isccloud.io (portal.live.isccloud.io)

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/portal1.png)

2. Once you confirm your email and log into portal, you will get redirected to Deployments page. Let's click "Create Deployment" button to create deployment.

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/portal2.png)

3. Select and create FHIR Accelerator Service with default parameters and set the unique name for deployment. (Screen here taken from live cloud portal but actually we have created deployment on test, need to think about right version for it).

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/portal3.png)

4. Once deployment is created and running, click on it and go to "Data Management" menu, and select "Bundle Operations" tab. This is where we can populate server with sample patient databases. At now we upload and import 'Synthea Population ~50' bundle. 

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/portal4.png)

5. Go to the Credentials page and create new API Key and new Server User credentials and save it for IRIS

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/portal5.png)

6. Now we have fully set up our FHIR server! Go to the Overview page and at the FHIR Details section will be shown Api Key and OAuth 2.0 Endpoints that we can use next in IRIS for working with requests

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/portal6.png)

#### Setup telegram-bot
##### Create telegram-bot:
Open a Telegram messenger, log into your account or create a new one.
1. Enter @BotFather in the search box and select a bot

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/bot1.png)

2. Click «Start» to activate BotFather bot

3. Enter and send the /newbot command

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/bot3.png)

4. Give the name to the bot - customers will see this name when communicating with the bot. And the nickname bot - it will be possible to find a bot in Telegram. Nickname should be unique, do not repeat existing in the base and end with the word «bot»

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/bot4.1.png)

You will need a token to connect the bot to InterSystems IRIS. Copy the token value and proceed to the last item. The token looks something like 123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11,  but we'll use simply <your token> in this document instead.

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/bot4.1.png)

 5. Add the necessary commands to your bot. Enter the /setcommands and select the bot you want to set the list of commands in the offered format. 
You will need a token to connect the bot to InterSystems IRIS. Copy the token value and proceed to the last item. The token looks something like 123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11,  but we'll use simply <your token> in this document instead.
 
 ![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/bot5.png)

####  Set up Production

##### Connection telegram-bot to InterSystems IRIS:

1. Set a WebHook for your Bot is to issue a GET request to the Bot API (it’s enough to open an url in your browser).
Call the setWebHook method in the Bot API via the following url:
```
https://api.telegram.org/bot<your token>/setWebhook?url=<url_to_send_updates_to>
```

2. Setup the Basic Settings of operation that will send messages to the telegram bot.
HTTP Server: api.telegram.org
HTTP Port: 443
URL: /bot<your token>
  
  ![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/setup.png)

### FHIR Data Source
  [todo]
 
  ![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/dataSource.png)



## Frontend

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 14.1.2.

### Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

### Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

### Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

### Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

### Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

### Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.

# Thanks

**We thank InterSystems for an opportunity to work on important present-day female issues. We hope that our bot-reminder open-source project will help our colleagues to innovate and solve complex healthcare issues to help women to feel good and stay healthy**
