targetScope='subscription'

param resourceGroupName string = 'azkiranrg'
param resourceGroupLocation string = 'eastus'
param storageName string = 'azkiran3010'
param storageLocation string = 'eastus'
param cdnProfileName string = 'azkirancdn32324'
param cdnEndpointName string = 'azkiranep438110'

resource newRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: {
    ProjectName: 'Internal'
  }
}

module storageAcct 'storage.bicep' = {
  name: 'storageModule'
  scope: newRG
  params: {
    storageLocation: storageLocation
    storageName: storageName
  }
}

module cdn 'cdn.bicep' = {
  name: 'cdnModule'
  scope: newRG
  params: {
    storageLocation: storageLocation
    storageName: storageName
    cdnProfileName: cdnProfileName
    cdnEndpointName: cdnEndpointName
  }
}