param storageLocation string
param storageName string
param cdnProfileName string
param cdnEndpointName string

resource cdnProfile 'Microsoft.Cdn/profiles@2020-09-01' = {
  name: cdnProfileName
  location: storageLocation
  sku: {
    name: 'Standard_Microsoft'
  }
}

resource cdnEndpoint 'Microsoft.Cdn/profiles/endpoints@2020-09-01' = {
  parent: cdnProfile
  name: cdnEndpointName
  location: storageLocation
  properties: {
    originHostHeader: '${storageName}.${environment().suffixes.storage}'
    originPath: '/web'
    origins: [
      {
        name: 'storage'
        properties: {
          hostName: storageName 
        }
      }
    ]
    isCompressionEnabled: true
  }
}
