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



# Project Plan

This section of the Readme.md file contains the Project Plans for the first quarter and the first year based on the CI/CD Project. For the yearly plan this has
been broken up into 4 quarters with enhancements included that enable the ML Flask App to be developed further as well as potentially becoming the start of a
Product that could see it used elsewhere in other areas of industry. 

A Trello board has been created that contains an example of the tasks to be carried out for the Q1 release of the CI/CD Project. This can be found using 
following link;
https://trello.com/b/sMm2HPxI/cicdproject2

The Excel Spreadsheets created for the Quarterly and Yearly plan can be found in the GitHub repo as follows;

Quarterly Plan - https://github.com/skearn64/cicd_project2/edit/main/Q1_2021_CICD_Pipeline.xlsx

Yearly Plan - https://github.com/skearn64/cicd_project2/edit/main/Y1_2021_CICD_Pipeline.xlsx

# Instructions - Architectural Diagrams
  
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



# Instructions - Running the Python project
Instructions on how the Project is set-up and to run it at each stage are detailed below. Assumptions have been made and these are outlined first.
Once the Azure Pipelines has been created the documentation does detail how the user can make a simple change to show that the full end to end CI/CD process works successfully.

## Assumptions:

The following assumptions have been made regarding the user running through the documentation.
* That the user has knowledge of GitHub.
* That the user has access to the GitHub repo cicd_project2 and an Azure account is already set-up.
* That the user has signed into GitHub and Azure (Portal and DevOps)
* That the SSH keys required to allow the clone of the GitHub repo cicd_project2 have been created with a suitable name.
* That the GitHub Actions has already been created within the cicd_project2 to carry out Continuous integration.
* That the Azure Pipelines have been created to provide the Continuous Delivery stage.
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



## Basic test of Python Code

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
* python3 -m venv ~/.cicd_project2
* source ~/.cicd_project2/bin/activate

The should resemble the following;

![python virtual env setup](https://github.com/skearn64/cicd_project2/edit/main/python_virtual_env_setup.png)

With the virtual environment created we need to run the `make all` command.
Running this returns the output displayed in the make all screenshot found below.

![make all success](https://github.com/skearn64/cicd_project2/edit/main/hello_py_pylint_pytest.png)



## Using GitHub Actons for CI

In this project we used GitHub Actions to provide the continuous integration of the machine learning application.
Simply put we want the ability to automatically build and test the code whenever we change and upload a file to the GitHub repo.
We know the `make all` previously ran was successful, so now instead of us having to manually run this everytime we'll get GitHub Acctions to do it for us.

From the GitHub repo clicking on the Actions option will enable GitHub Actions to be created. For this project we just selected the `set up a workflow yourself' and this created the file pythonapp.yml with some generic scaffolding code present.

The generic code was replaced with the specific scaffolding code that sets up the right version of Python, then remotely carries out the install, lint and test 
Changing the file and pushing it to GitHub triggers the GitHub Actions to run and therefore completes the Continuous Integration. This can easily be checked by making a simple change to the pythonapp.yml code and saving this.
Once done selecting the Actions option in the cicd_project2 repo will display the build in progress as shown below;

![GitHub Actions Build process](https://github.com/skearn64/cicd_project2/edit/main/github_actions_build_process.png)

And once the build is complete we can see verify this by checking that each step completed successful and produces an output similar to the image below;

![GitHub Actions Passing Tests](https://github.com/skearn64/cicd_project2/edit/main/github_actions_showing_CI_passing_tests.png)

[![Actions Status](https://github.com/skearn64/cicd_project2/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)](https://github.com/skearn64/cicd_project2/actions)

## Continuous Integration/Continuous Delivery using Azure Pipelines

We're now at the stage when we can start to create our CI/CD Azure Pipeline.
Each of the stages noted below can be followed using the official Microsoft Azure documentation referenced in the link below;
(https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops)

This documentation is specific in creating a CI/CD Azure Pipeline for the deployment of a Python Web App as a Azure App Service running on Linux. 


### Provisioning the initial Azure App Service
Before completing the final stage of the Continuous Delivery process and integrating it with Azure Pipelines there is a need to provision the Azure App Service.
The creation of the Azure App Service follows an install, deploy and test/check process.


1. The first of these; the install phase, starts with running the `make install` command. This installs the components required initially deploy and run the Flask ML app.  

From the Azure Cloud Shell prompt run the `make install` command. 
This will run through the Makefile and produce the output shown in the screenshot below, showing successful completion;

![Make install output](https://github.com/skearn64/cicd_project2/edit/main/make_install_output.png)


2. Once the above step has completed successfully the app service can then be initially deployed to the Cloud Shell
From the Azure Cloud Shell run the command
* az webapp up -n flask-ml-app-proj2 (the name given to the Flask ML App. This can be anything for the initial creation, but will then be used going forwards.
  
This will step through the deployment of the app service and complete as shown in the next screenshot;

![Deploy az webapp up](https://github.com/skearn64/cicd_project2/edit/main/deploy_webapp_az_webapp_up.png)


In the screenshot you can see the URL ( http://flask-ml-app-proj2.azurewebsites.net ) to be used to test the initial deployment. Entering this into a browser produces the following;

![SKlearn Prediction Home Page](https://github.com/skearn64/cicd_project2/edit/main/Sklearn_Prediction_change.png)

We can then see that the deployment worked as required. Later on we will make a change and use Azure Pipelines to show that the automated Continuous Integration / Continuous Delivery works.

3. The final part of creating the Azure App Service is to check that the prediction actually works. This can be tested locally; later on we'll run it using the Azure App 
To run locally use the file make_prediction.sh. Enter the command `./make_prediction.sh` and the outout will look similar to the following;

![Run local make prediction](https://github.com/skearn64/cicd_project2/edit/main/make_prediction_run_local.png)



### Creating the Azure DevOps Project
We're now onto the last stage of completing the Continuous Delivery using Azure Pipelines  
For this we need to first create a project in Azure DevOps running through the steps below.
1. Login to Azure DevOps if not already. This will display the home page

![Azure DevOps Home Page](https://github.com/skearn64/cicd_project2/edit/main/azure_devops_home_page.png)

2. Click on the `+New Project` in the top right hand corner and at the new screen enter the Project name, description and select Public as detailed below

![Azure DevOps Proj Details](https://github.com/skearn64/cicd_project2/edit/main/azure_devops_add_new_proj_details.png)



### Creating the Azure connection
Now the Project has been created a new service connection needs to be established between the Project and Azure. The steps below guide you through this stage.
1. Select the Project and then go into the project settings which will resemble something similar to the image below;

![Project_Settings_and Service Connection](https://github.com/skearn64/cicd_project2/edit/main/azure_devops_new_service_connect.png)

2. Select the Service Connections option at the bottom of the project settings menu, and then at the next stage select Azure Resource Manager and click Next

![Select Azure Resource Manager](https://github.com/skearn64/cicd_project2/edit/main/azure_devops_service_conn_arm.png)

3. At the following screen select the Service Principal (automatic) if it's not already checked and click Next

![Select Service Principal](https://github.com/skearn64/cicd_project2/edit/main/azure_devops_service_conn_auto.png)

4. In the `New Azure Service Connection` window ensure Subscription is highlighted and then select the subscription from the drop down menu. Clicking on the Resource group drop down will prompt you to login to Microsoft and to confirm your credentials. Upon success this will populate the resource group drop down list

![Select Subscription](https://github.com/skearn64/cicd_project2/edit/main/azure_devops_new_service_sub.png)

5. From the drop down select the resource group to use and then provide a name for the service connection and click on Save as shown below;

![Select RG and provide name](https://github.com/skearn64/cicd_project2/edit/main/azure_devops_service_conn_rg_name.png)



### Creating the Azure Pipeline for deployment
With both the Project and service connection created the last stage is to actually create the Azure Pipeline itself.
Ensure the Project recently created is displayed and then select Pipelines from the left hand menu. Continue to create the Azure Pipeline as detailed below.
1. If no Pipelines have been created (as in the case of a new project) then click on the `Create Pipeline` in the middle of the page displayed
If an Azure Pipeline already exists then click on the `+New Pipeline` in the top right hand corner as show in the image below;

![New Pipeline](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_create_new.png)

2. You now need to select where your code is hosted. This offers a number of options but for this we are using GitHub, so select this.

![Where is the code hosted](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_where_is_code.png)

3. Next we need to configure the Azure Pipeline to use our GitHub repo where the files to be used are stored. From the list displayed select the repo previously used. In this case it will be cicd_project2.

![Select GitHub repo](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_select_repo.png)

4. This next stage requires the type of Pipeline to be selected. As this is a Python Web App running on Linux we'll select the `Python to Linux Web App on Azure`

![Select Python Web App Pipeline](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_python_to_linux.png)

5. We now need to confirm the Azure subscription to use. In this instance there is only one as show in the image below, so click on Continue;

![Subscription to use](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_select_sub_to_use.png)

6. The final step to create the Azure Pipeline is to provide the Web App name. This should be the same name given to the Azure App Service previously created.

![Web App Name and validate](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_webapp_name_valid.png)

Now that we have stepped through the creation of the Azure Pipeline we just need to validate and configure it by clicking on the button present.

Azure Pipelines will now create an azure-pipelines.yml file. This details the stages that your created Azure Pipeline will follow in the CI/CD process.
Viewing the YAML file displayed you'll notice that the creation of the Pipeline has pre-populated the webAppName and environmentName fields with the name of the Flask ML App you created when you provisioned the initial Azure App Service.



### Running Azure App Service from Azure Pipelines
You're now ready to run the Azure Pipeline and check that the CI/CD automation works correctly.
To do this we need to save the azure_pipelines.yml file by clicking on `Save and run` in the upper right hand corner of the editor.
A pop-up window will appear with the Commit message field populated. Click on the `Save and run` in the bottom right. This will now commit the changes to the GitHub repo and display the Azure Pipeline job running.

From the Summary we can see the job queued and clicking on   

![Azure Pipeline Deploy Completed](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_upload_files_deploy.png)

Once complete go back to the Summary page of the jobs run. From here you can see that the last job run (at the top of the list) was successful

![Summary Page of Jobs run](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_first_run.png)

The final checks to ensure Azure Pipelines has deployed the Flask App is to verify the project has been deployed into the Azure App Service and that a prediction is successful by using the file `make_predict_azure_app.sh`
Viewing the App Services via the Azure Portal the following can be seen;

![Project Deployed in Azure App Service](https://github.com/skearn64/cicd_project2/edit/main/azure_app_service_deployed_via_portal.png)

Running the file `make_predict_azure_app.sh` from the Azure Cloud Shell will display the following outout;

![Make Prediction via Azure App](https://github.com/skearn64/cicd_project2/edit/main/make_predict_azure_app.png)

Note: this may return with a permission denied error. This is easily resolved by ensuring that the execute permission is applied to the file.



### Checking Continuous Integration / Continuous Delivery Operation
Now the Azure Pipelines has been created and performs automatic deployments we can check the full end to end Continuous Delivey process by making a change to a file, which will then cause a new build and deployment to proceed.

From GitHub edit the file app.py and find the line starting `html = "<h3>Sklearn Prediction Home</h3>"`
Change this to now read `html = "<h3>Sklearn Prediction Home Service by Continuous Delivery</h3>"` and save the file.

This will trigger the Azure Pipelines to perform the automated Continuous Delivery process. Viewing the status of the deployments (both past and present) can be seen by selecting the Azure Pipelines option under the Azure DevOps Project previously created. 
A similar summary page is shown in the following image;

![Azure Pipeline Job Queued](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_run_after_change.png)

The job at the top of the list shows a blue circle indicating that the pipeline job is queued and the status of `Just now` can be seen on the right hand side.
Selecting the job will show the stages of the CI/CD process, as seen in the example below;

![Azure Deploy Complete](https://github.com/skearn64/cicd_project2/edit/main/azure_pipeline_deploy_webapp_after_update.png)

Running through each step will end with a successful deployment. Clicking on the Deploy Web App stage will enable each of it's steps to be viewed.
Clicking on the Deploy Azure WebApp will open the log. Taking the URL from the line `App Service Application URL` and pasting this into a browser will bring up the web app with the new change visible as demonstrated in the example.

![SKlearn Prediction Web Change](https://github.com/skearn64/cicd_project2/edit/main/Sklearn_prediction_code_change.png)


## Streaming or Inspection of Log files
The final stage of running through this project is to check that the deployment of the app completed successfuly.
This can be achieved in two ways;

1. Through streaming the az webapp log using the tail command. This is achieved by opening up a separate window and running the command
* az webapp log tail

Then in another windows running the prediction script `./make_prediction.sh` locally or `./make_predict_azure_app.sh` 

The logs produced from the running one of those prediction scripts above should then be visible in the window streaming the log file and be similar to the image below;

![Webapp log tail](https://github.com/skearn64/cicd_project2/edit/main/az_webapp_tail_of_logs.png)

2. Inspecting the running application through a URL call to its specific logs using;
* https://<your app name>.scm.azurewebsites.net/api/logs/docker 

The outout of which will be similar to that shown below

![Logfile output from Flask ML API](https://github.com/skearn64/cicd_project2/edit/main/logfile_output_from_flask_ml_api_run.png)

# Enhancements

The Machine learning API using the pre-trained model predict housing prices in the Boston area.
We can though add a number of changes to make this a much more powerful app. Some ideas are as follows;
  
* Introduce the use of a config file for housing predictions from other areas
* Allow other factors such as changing number of rooms, family size etc... to be changed through WebGUI
* Enhance the WebGUI to display the data in different formats and allow field changes and validation
* Develop as a Mobile App that uses your location to provide housing predictions
* Provide links to local estate agents/realtors to search for ideal houses

These enhancements have already been included in the yearly project plan, along with a a few more. 


# Demo 
The Demo Video of for Building a CI/CD Project can be found at the following location on YouTube
https://youtu.be/kKUeyU0_nK0
  


