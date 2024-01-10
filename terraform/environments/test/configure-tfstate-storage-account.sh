#!/bin/bash
RESOURCE_GROUP_NAME="Azuredevops"
STORAGE_ACCOUNT_NAME="tfstate$RANDOM$RANDOM"
CONTAINER_NAME="tfstate"

# Create storage account
az storage account create --resource-group "Azuredevops" --name "tfstate8769878" --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group "Azuredevops" --account-name "tfstate8769878" --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY

# Create blob container
az storage container create --name "tfstate" --account-name "tfstate8769878" --account-key "sFqfQBs1j39pRG1lEVJjt9pAsXH0d0oNeYz1uWZvevaJcEwtUtem2XSlmIKM0GjmBDrbG95Mpibc+AStMgGsyg=="
echo "RESOURCE_GROUP_NAME=$RESOURCE_GROUP_NAME"
echo "STORAGE_ACCOUNT_NAME=$STORAGE_ACCOUNT_NAME"
echo "CONTAINER_NAME=$CONTAINER_NAME"
echo "ACCOUNT_KEY= sFqfQBs1j39pRG1lEVJjt9pAsXH0d0oNeYz1uWZvevaJcEwtUtem2XSlmIKM0GjmBDrbG95Mpibc+AStMgGsyg=="

