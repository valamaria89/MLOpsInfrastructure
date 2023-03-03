//param
param environ string
param name string 
param location string 

// Template variables
var containerRegistryname= 'containerregistry-${name}-${environ}'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  sku: {
    name: 'Standard'
  }
  name: containerRegistryname
  location: location
  properties: {
    adminUserEnabled: true
  }
}


output containerRegistryName string = containerRegistry.name
output containerRegistryId string = containerRegistry.id
