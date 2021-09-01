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

## Instructions - Architectural Diagrams
  
The first diagram shows the logical architecture between the GitHub repository created and its link with the Azure Cloud Shell.
The initil files are upload to the GitHub repo and then through the git clone command the repository is cloned to the Azure Cloud Shell
Further git commands allow new/updated files to be added to the GitHub repo (git add, git commit and git push) along with the ability to pull files (git pull)
added to the GitHub repo from external sources and which may not have been initially cloned to the Azure Cloud Shell
The Azure Cloud Shell is where the Python virtual environment is created allowing the user to install python components using pip, as well as running pylint and 
pytest as part of the Make process, that is installed from the use of the requirements.txt file.
The requirements.txt details specific versions of the components to be used when running the make process.  

https://github.com/skearn64/cicd_project2/edit/main/GitHub_Azure_Cloud.docx


This second diagram provide the logical process followed when GitHub Actions has been implemented to complete the continuous integration stage of the Building  
a CI/CD Pipeline.
It shows a simple example where a change is made to the file hello.py. This change is committed to GitHub using the git add, git commit and git push commands.
The change to the GitHub repo triggers the GitHub Action previously created. This carries out the steps of install, pylint and pytest added to the .yml file.
The build starts and works it's way through each step, only stopping if an error occurs.
A successful build signifies that the Project can continue to the Continuous Delivery stage; that of implementing Azure Pipelines  

https://github.com/skearn64/cicd_project2/edit/main/GitHub_Actions_Azure_Cloud.docx

The final architectural diagram below completes the full CI/CD process, using Azure Pipelines and Azure App Service to deploy the Flask Machine Learning API.
A change to a file in the Azure Cloud Shell triggers the Azure Pipeline already associated with with the GitHub repo created at the start of this Project.
This carries out the build process ending in the successful deployment as an Azure App Service.

https://github.com/skearn64/cicd_project2/edit/main/GitHub_Azure_Pipeline_CD.docx



## Instructions - Running the Python project
<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

# Assumptions:
That the user has knowledge of GitHub.
That the user has access to the GitHub repo cicd_project2 and an Azure account is already set-up.
That the user has signed into GitHub and Azure (Portal and DevOps)
That the SSH keys required to allow the clone of the GitHub repo cicd_project2 have been created with a suitable name.
That the GitHub Actions has already been created within the cicd_project2 to carry out Continuous integration.
That the Azure Pipelines have been created to provide the Continuous Delivery stage.

* Clone the GitHub repo to Azure Cloud
The first task the user needs to carry out is to clone the GitHub repo known as cicd_project2. This contains the code required to run through the steps outlined in the Project known as Building a CI/CD Pipeline. The steps to follow are detailed below;

1. In GitHub go to the repo created and ensure the code option is selected.
2. Click on the green Code button and under the Clone section ensure SSH is underlined. Copy the URL. This will confirm that it has been copied.
3. Open up an Azure Cloud Shell terminal from the Azure Portal and expand this.
4. At the command prompt type the command git clone and past in the gitHub URL copied in step 2 and enter yes to continue.
5. Confirm that the clone has been successful by changing directory to the repo name created, i.e. cd cicd_project2. The output will resemble that shown in the screenshot  

![Git clone](https://github.com/skearn64/cicd_project2/edit/main/git_clone_to_azure.png)

And the files in the directory will look similar to the following;

![File listing](https://github.com/skearn64/cicd_project2/edit/main/listing_of_cicd_project2_files.png)


# Basic test of Python Code
It should now be easy to check the virtual python environment created and test that the scaffolding code performs a simple install, lint and test successfully. To do this though we need to make a few filename changes.

The cicd_project2 directory contains two Makefiles and two requirements.txt files. To test that your code initially works these need to be changed.
From the Azure Cloud Shell rename the following files;
* Makefile to Makefile_new
* Makefile_orig to Makefile
* requirements.txt to requirements_new.txt
* requirements_orig.txt to requirements.txt

The Makefile now contains a basic pip install. It will run pylint and pytest calling in the python code contained in the files hello.py and test_hello.py.
The requirements.txt contains the calls to the pylint and pytest packages

Now the Makefile and requirements.txt are correct we need to create the Python virtual environment from in the Azure Cloud Shell using the following commands;
python3 -m venv ~/.cicd_project2
source ~/.cicd_project2/bin/activate

The should resemble the following;

![python virtual env setup](https://github.com/skearn64/cicd_project2/edit/main/python_virtual_env_setup.png)

With the virtual environment created we need to run the `make all` command
Running this returns the output displayed in the make all screenshot found below.

![make all success](https://github.com/skearn64/cicd_project2/edit/main/hello_py_pylint_pytest.png)



*****GitHub Actons next

In this project we're going to use GitHub Actions to provide the continuous integration of the machine learning application.
Simply put we want the ability to automatically build and test the code whenever we change and upload a file to the GitHub repo.
We know the `make all` previously ran was successful, so now instead of us having to manually run this everytime we'll get GitHub Acctions to do it for us.



******Before creating the app service and deploying the app via the Azure Cloud Shell


* Project running on Azure App Service
Before completing the final stage of the Continuous Delivery process there is a need to first set-up the Azure App Service before integrating it with Azure Pipelines. The creation of the Azure App Service follows an install, deploy and test/check process.


1. The first of these; the install phase, starts with running the `make install` command. This installs the components required to run the Flask ML app.  

From the Azure Cloud Shell prompt run the `make install` command. 
This will run through the Makefile and produce the output shown in the screenshot below, showing successful completion;

![Make install output](https://github.com/skearn64/cicd_project2/edit/main/make_install_output.png)


2. Upon completion of the above step the app service can then be initially deployed to the Cloud Shell
From the Azure Cloud Shell run the command
  az webapp up -n flask-ml-app-proj2
  
This will step through the deployment of the app service and complete as shown in the next screenshot;

![Deploy az webapp up](https://github.com/skearn64/cicd_project2/edit/main/deploy_webapp_az_webapp_up.png)


3. In the screenshot you can see the URL ( http://flask-ml-app-proj2.azurewebsites.net ) to be used to test the initial deployment. Entering this into a browser produces the following;

![SKlearn Prediction Home Page](https://github.com/skearn64/cicd_project2/edit/main/Sklearn_Prediction_change.png)

* Output of a test run
The final part of creating the Azure App Service is to check that the prediction actually works. The file make_predict_azure_app.sh has already been adapted to call the Azure App Service deployed. To run this enter the command ./make_predict_azure_app.sh
Note this may return with a permission denied error. This is easily resolved by ensuring that the execute permission is applied to the file.
Upon running the file it should display the following;

![Make prediction with azure app](https://github.com/skearn64/cicd_project2/edit/main/make_predict_azure_app.png)



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
The final stage of running through this project is to check that the deployment of the app completed successfuly.
This can be achieved in two ways.
1. Through streaming the az webapp log using the tail command 
2. Inspecting the running application through a URL call to its specific logs

Add in images of webapp tail and URL link to logs


> 

## Enhancements

<TODO: A short description of how to improve the project in the future>
Introduce the use of a config file for housing predictions from other areas
Allow other factors such as changing number of rooms, family size etc... to be changed through WebGUI
Enhance the WebGUI to display the data in different formats and allow field changes and validation
Develop as a Mobile App that uses your location to provide housing predictions
Provide links to local estate agents/realtors to search for ideal houses



## Demo 

<TODO: Add link Screencast on YouTube>


