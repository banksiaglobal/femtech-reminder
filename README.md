# femtech-reminder

# FemTech Reminder for InterSystems FHIR Contest 

## Introduction

Today in the modern society and fast life, women priorities include not just caring about family and kids, but also building business and career, leaving no time to care about her health and regularly checkups, often not suspecting about developing health issues.

According to research by leading healthcare organizations, early diagnostics and observation may significantly reduce risks of severe women health problems.

Our project helps to solve this problem and allows the user to receive reminders about regular visits to the clinic. We have developed notification system which connects to FHIR data storage, analyses patient's data, and gives a prompt notification to visit a doctor. 


## Summary

This system is a set of components: the server part based on InterSystems IRIS for Health, a cloud-based FHIR server, and two client parts: - telegram bot-reminder and Web GUI.
The server part analyses patient's data and send a notification to visit a doctor or to do laboratory examinations via the telegram bot. Administrators use web-based GUI interface to configure recommendations.


## Map mind

When brainstorming the solution to apply for this contest, our team came up with the following possible use cases for a female health reminder application, and divided them into three levels: top level (blue) describes actors (WHO?), middle layer (yellow) describes use cases (WHAT?) and third level (pink) describes tasks (HOW?)

## Application Layout

* you go to GUI
* create a new recommendation
* go into the telegram bot
* enter your data
* get a recomendations*/


## Online Demo

[bot](http://https://t.me/bg_fhir_bot)
Bot: https://t.me/bg_fhir_bot


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

## Backend

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
