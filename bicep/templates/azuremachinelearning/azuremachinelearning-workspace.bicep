//param
param environ string
param name string 
param location string
// Template variables
var azmlwname = 'mlw-${name}-${environ}'


resource azMachineLearning 'Microsoft.MachineLearningServices/workspaces@2022-05-01' = {
  identity: {
    type: 'SystemAssigned'
  }
  name: azmlwname 
  location: location
  properties: {
    friendlyName: azmlwname 
   
  }
 
}

output azMachineLearningName string = azMachineLearning.name
output azMachineLearningId string = azMachineLearning.id
