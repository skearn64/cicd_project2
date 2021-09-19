#!/bin/bash

# Create Virtual environment in Azure CLI
python3 -m venv ~/.cicd_project2

# Source the environment
source ~/.cicd_project2/bin/activate

# Create the webapp via az command
az webapp up -n flask-ml-app-proj2

# Display the log file from the running webapp in another window
az webapp log tail
