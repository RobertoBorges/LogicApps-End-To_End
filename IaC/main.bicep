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
