# FemTech Reminder for InterSystems FHIR Contest 

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/photo_2022-11-16_15-59-06.jpg)


## Introduction

**This project is still work-in-progress, we will present final version before contest cut-off date**

Today in the modern society and fast life, women priorities include not just caring about family and kids, but also building business and career, leaving no time to care about her health and regularly checkups, often not suspecting about developing health issues.

According to research by leading healthcare organizations, early diagnostics and observation may significantly reduce risks of severe women health problems.

Our project helps to solve this problem and allows the user to receive reminders about regular visits to the clinic. We have developed notification system which connects to FHIR data storage, analyses patient's data, and gives a prompt notification to visit a doctor. 


## Summary

This system is a set of components: the server part based on InterSystems IRIS for Health, a cloud-based FHIR server, and two client parts: - telegram bot-reminder and Web GUI.
The server part analyses patient's data and send a notification to visit a doctor or to do laboratory examinations via the telegram bot. Administrators use web-based GUI interface to configure recommendations.

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/schema.png)


## Map mind

When brainstorming the solution to apply for this contest, our team came up with the following possible use cases for a female health reminder application, and divided them into three levels: top level (blue) describes actors (WHO?), middle layer (yellow) describes use cases (WHAT?) and third level (pink) describes tasks (HOW?)

![mind map](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/map.png)


## Application Layout

* you go to GUI
* create a new recommendation

![gui](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/Application-Layout-GUI.gif)


* go into the telegram bot
* enter your data
* get a recomendations*/

![telegram](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/Application-Layout-Telegram.gif)


## Online Demo

[demo](//todo)

[bot](https://t.me/bg_fhir_bot)

## Video

[youtube](//todo)


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

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/descriptionSystem.png)


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

## How to run

## Docker deployment from github

1. You should clone this repo 

```
git clone https://github.com/banksiaglobal/femtech-reminder.git
```

2. You should select the command `docker compose up`

![image](https://user-images.githubusercontent.com/110831804/203649662-247a8fba-9000-4d05-977e-c3e33eab41ad.png)


## ZPM deployment

You need to install web-server with https (for telegram bot webhook) or implement the necessary access to the local computer through a service such as
[ngrok.com](https://ngrok.com/)

1. ##### Install InterSystems IRIS for Health Community [install](https://docs.intersystems.com/irisforhealthlatest/csp/docbook/DocBook.UI.Page.cls?KEY=HXIHINST_install)

2. ##### Add FEMTECHREMINDER namespace

![image](https://user-images.githubusercontent.com/110831804/203926203-da5a75ea-d536-4463-8047-476f6d231e05.png)

3. Add SSL server config for Telegram Bot WebHook and SSL client config

![image](https://user-images.githubusercontent.com/110831804/203926305-96c08c20-880c-413e-ab4c-416b10869a0c.png)

![image](https://user-images.githubusercontent.com/110831804/203926382-25b797c4-1abd-4386-8a8e-9ebfdb1f8d94.png)

![image](https://user-images.githubusercontent.com/110831804/203926423-ac5f9364-172c-4abf-8baf-a89e0711a473.png)

4. ##### Install a Foundation and HTTP Service for FEMTECHREMINDER

   Management Portal ->  Health -> Installer Wizard
   
![image](https://user-images.githubusercontent.com/110831804/203926572-4a1f7ccc-d3b5-4a6f-994c-36aa53fa2392.png)

![image](https://user-images.githubusercontent.com/110831804/203926998-2410b12c-bf9a-4a60-9262-a581a2b491db.png)

   Press "Activate" link for activate Foundation
   
   Management Portal ->  Health -> Service Registry
   
![image](https://user-images.githubusercontent.com/110831804/203927159-95828a50-bb8c-4b68-a45e-3a7fba507489.png)

5. [Install ZPM](https://github.com/intersystems/ipm)

6. ##### Install FEMTECHREMINDER package by ZPM

```
zpm "install femtech-reminder"
```
7. ##### Setup production

![image](https://user-images.githubusercontent.com/110831804/203927858-f23dd657-4cd6-4988-904c-767702ca3230.png)

Open production

![image](https://user-images.githubusercontent.com/110831804/203927954-5da54b9e-4360-41a4-8822-170560f5e7df.png)

![image](https://user-images.githubusercontent.com/110831804/203928009-9744329f-beae-46aa-80ad-ee4cf50e30aa.png)

### Check settings:

##### FTR.Production.Service.TelegramIn:

* Port: (8443)

* SSL Configuration (webhook)

#### FTR.Production.Operation.FHIROut:

* XApiKey (API Key of Telegram bot)

* ServiceName (FHIRR)

#### Operation.TelegramOut:
* HTTP Server (api.telegram.org)
* HTTP Port (443)
* URL (/bot)
* BotToken (979906407:...TZK)
* SSL Configuration (sslclient)
   
   
## Setup FHIR Server

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


## Setup telegram-bot

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

##  Set up Production

##### Connection telegram-bot to InterSystems IRIS:

1. Set a WebHook for your Bot is to issue a GET request to the Bot API (it’s enough to open an url in your browser).

Call the setWebHook method in the Bot API via the following url:
```
https://api.telegram.org/bot<your token>/setWebhook?url=<url_to_send_updates_to>
```

2. Setup the Basic Settings of operation that will send messages to the telegram bot.

HTTP Server: api.telegram.org

HTTP Port: 443

URL: /bot

BotToken: <your token>
  
![image](https://user-images.githubusercontent.com/110831804/203779668-d27c70d4-6a1b-48c8-9563-4b3329d0b357.png)

  
### Telegram-bot interaction tools

#### Commands:

* /start - initiation of work with bot;
* /stop - log off user from system;
* /help - show all commands;
* /registration - initialization of the regression process;
* /next_notification - send the following recommendation note;

#### User from FHIR for test:

* female
```
User User 2000-01-01
```
* female, pregnant
```
Freeda113 Schoen8 1955-09-23
```

### Visual trace

Example visual trace of command /next_notification

![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/virtualTrace.png)


### FHIR Data Source
 

![](https://user-images.githubusercontent.com/110831804/203654739-4fdd48a0-3304-4e30-9ec0-766da5df4efb.png)
 
![](https://github.com/banksiaglobal/femtech-reminder/blob/main/src/image/dataSource.png)


## Frontend

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 14.1.2.

### Development server
   
 * you should clone this repo 
   
```
git clone https://github.com/banksiaglobal/femtech-reminder.git
```
 * enter in your terminal
```
cd angular/src/app
```

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

**We thank InterSystems for an opportunity to work on important present-day female issues**


# About authors

<h3 style="text-align: center;">We are the team of Banksia Global company and we always are opened for something new and interesting</h3>

![image](https://user-images.githubusercontent.com/110831804/203932894-74f67cf6-0681-4279-94da-752e2e747c13.png)

<h3 style="text-align: center;>We hope that our bot-reminder open-source project will help our colleagues to innovate and solve complex healthcare issues to help women to feel good and stay healthy</h3>

![image](https://user-images.githubusercontent.com/110831804/203936782-568deeac-6aeb-4275-a0c5-f051770415a1.png)






