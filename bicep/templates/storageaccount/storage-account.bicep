// Standard template parameters
param environ string
param name string 
param location string

// Specific template parameters
//param accessTier string = 'Hot'
//param publicNetworkAccess string = 'Disabled'
//param bypass string = 'None'

// Template variables
var storagename= 'storageaccount-${name}-${environ}'

resource storage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storagename
  location: location
  tags: resourceGroup().tags
  sku: {
    name: 'Standard_RAGRS'
  }
  kind: 'StorageV2'
  properties: {
    encryption: {
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    supportsHttpsTrafficOnly: true
  }
}

output storageName string = storage.name
//output storageNameShort string = replace(replace(storage.name, environ, ''), locationShort, '')
output storageId string = storage.id


