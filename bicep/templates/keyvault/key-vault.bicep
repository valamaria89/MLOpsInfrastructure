//param
param environ string
param name string 
param location string

// Template variables
var keyVaultName = 'keyvault-${name}-${environ}'

resource keyVault 'Microsoft.KeyVault/vaults@2021-10-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      name: 'standard'
      family: 'A'
    }
    accessPolicies: []
    enableSoftDelete: true
  }
}


output keyVaultName string = keyVault.name
output keyVaultId string = keyVault.id
