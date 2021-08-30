# Overview

This is the second Project of the DevOps Engineer for Microsoft Azure Nanodegree Program
This focuses on the concept of Continuous Integration and Continuous Delivery using firstly GitHub Actions and then Azure Pipelines.
It takes the knowledge gained fron the lessons involving Agile Development, Agile Planning and Communication, Continuous Integration, and Continuous Delivery and 
combines them to form the final artefact entitled Building a CI/CD Pipeline.

The Project takes a python based machine learning application; of which the initial code is already provided, and using the Flask web framework develops this to 
enable continuous delivery and deployment of the final operational Microservice API
The initial code contains a pre-trained sklearn applicaiton, that predicts housing prices within the Boston area based on a number of external factors
The mian code for this machine learning application can be found in the python file known as app.py
The thought is that this pre-trained model could be developed as a Product and used for any application of a similar nature. 

The project starts with the creation of a new GitHub repository and the integration of this into Azure using the Azure Cloud Shell.
The initial scaffolding code, the use of a Make file and requirements.txt, and the creation of a python virtual environment allows the continous integration process to be created, providing the ability to link, test and deploy the API. This initial process is carried out through the use of GitHub Actions.

Once complete the attention is turned to the creation and configuration of Azure Pipelines to allow continuous delivery of the machine learning application as an Azure App Service.


## Project Plan
Project Plan
This section of the Readme.md file contains the Project Plans for the first quarter and the first year based on the CI/CD Project. For the yearly plan this has
been broken up into 4 quarters with enhancements included that enable the ML Flask App to be developed further as well as potentially becoming the start of a
Product that could see it used elsewhere in other areas of industry. 

A Trello board has been created that contains an example of the tasks to be carried out for the Q1 release of the CI/CD Project. This can be found using 
following link;
https://trello.com/b/sMm2HPxI/cicdproject2

The Excel Spreadsheets created for the Quarterly and Yearly plan can be found in the GitHub repo as follows;
Quarterly Plan - https://github.com/skearn64/cicd_project2/edit/main/Q1_2021_CICD_Pipeline.xlsx
Yearly Plan - https://github.com/skearn64/cicd_project2/edit/main/Y1_2021_CICD_Pipeline.xlsx

## Instructions

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


