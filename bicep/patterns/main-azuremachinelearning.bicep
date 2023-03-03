param name string 
param environ string 
param location string
//param locationShort string = ''
param suffix string = 'deploy'

param resourceType string = 'rg'
param Tags object = {}
//param RgLocation string = ''

var resourceGroupName = '${resourceType}-${name}-${environ}'

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
  tags: Tags
}


module appinsight '../templates/applicationinsight/applicationinsight.bicep' = {
  name: '${name}-appinsight-${suffix}'
  scope: resourceGroup
  params: {
    name: name
    environ: environ
    location: location
    //locationShort: locationShort
    
  }
}


module containerregistery '../templates/containerregistery/containerregistery.bicep' = {
  name: '${name}-containerregistery-${suffix}'
  scope: resourceGroup
  params: {
    name: name
    environ: environ
    location: location
    
  }
}

module keyvault '../templates/keyVault/key-vault.bicep' = {
  name: '${name}-keyVault-${suffix}'
  scope: resourceGroup
  params: {
    name: name
    environ: environ
    location: location
    
  }
}

module storageaccount '../templates/storageaccount/storage-account.bicep' = {
  name: '${name}-storageaccount-${suffix}'
  scope: resourceGroup
  params: {
    name: name
    environ: environ
    location: location
    
  }
}
 
module azmachinelearning '../templates/azuremachinelearning/azuremachinelearning-workspace.bicep' = {
  name: '${name}-azmachinelearning-${suffix}'
  scope: resourceGroup
  params: {
    name: name
    environ: environ
    location: location
    
  }
  dependsOn: [
    storageaccount
    keyvault
    appinsight
    containerregistery
  ]
}
