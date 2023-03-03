//param
param environ string
param name string 
param location string

param resourceType string = 'rg'
param Tags object = {}

var resourceGroupName = '${resourceType}-${name}-${environ}'

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
  tags: Tags
}

output resourceGroupName string = resourceGroup.name
