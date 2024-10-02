targetScope = 'subscription'

resource myResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'myResourceGroup'
  location: 'eastus'
}

module vnet 'vnet.bicep' = {
  name: 'vnet'
  scope: resourceGroup('myResourceGroup')
  params: {
    location: 'eastus'
    vNetName: 'vnet001'
  }
  dependsOn: [
    myResourceGroup
  ]
}

module storageAccount 'storageaccount.bicep' = {
  name: 'storageAccount'
  scope: resourceGroup('myResourceGroup')
  params: {
    baseName: 'sslogic'
  }
  dependsOn: [
    myResourceGroup
  ]
}

module privateEndpoint 'privateendpoints.bicep' = {
  name: 'privateEndpoint'
  scope: resourceGroup('myResourceGroup')
  params: {
    name: 'sspe001'
    subnetResourceId: vnet.outputs.storageaccsn
    privateLinkServiceId: storageAccount.outputs.storageAccountId
  }
  dependsOn: [
    vnet
    storageAccount
  ]
}
