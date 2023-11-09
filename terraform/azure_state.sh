#!/bin/bash

RESOURCE_GROUP_NAME=terraform-state
STORAGE_ACCOUNT_NAME=tfstate$RANDOM
CONTAINER_NAME=tfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus2

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container - use the connection string from the previous account creation output
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --connection-string "$ACCOUNT_KEY"