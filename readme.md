# README

## Overview

This is a simple example of how to deploy an end-to-end app service for Logic Apps

az deployment sub create --location eastus --template-file .\main.bicep --name mydeployment

az group delete --name myResourceGroup
