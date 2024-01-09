#!/bin/bash
RESOURCE_GROUP_NAME="Azuredevops"
STORAGE_ACCOUNT_NAME="tfstate$RANDOM$RANDOM"
CONTAINER_NAME="tfstate"

# Create storage account
az storage account create --resource-group "Azuredevops" --name "tfstate783534" --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group "Azuredevops" --account-name "tfstate783534" --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY

# Create blob container
az storage container create --name "tfstate" --account-name "tfstate783534" --account-key "F1Smrbsx+PWld46OZoVqKo/9gtvvLy8L4aLvMhzcxnIxOrABaKKiidafvBkpQXnIwpyMgQ2O2wT/+AStGE1R+Q=="
echo "RESOURCE_GROUP_NAME=$RESOURCE_GROUP_NAME"
echo "STORAGE_ACCOUNT_NAME=$STORAGE_ACCOUNT_NAME"
echo "CONTAINER_NAME=$CONTAINER_NAME"
echo "ACCOUNT_KEY= F1Smrbsx+PWld46OZoVqKo/9gtvvLy8L4aLvMhzcxnIxOrABaKKiidafvBkpQXnIwpyMgQ2O2wT/+AStGE1R+Q=="

