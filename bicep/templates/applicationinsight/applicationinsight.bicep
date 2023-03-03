//param
param environ string
param name string 
param location string

// Template variables
var appiname = 'applicationinsights-${name}-${environ}'

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appiname 
  location: location 
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output applicationInsightsName string = applicationInsights.name
output applicationInsightsId string = applicationInsights.id
