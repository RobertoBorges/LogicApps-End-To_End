@description('Location of the resource')
param location string = 'eastus'

@description('Name of the virtual network')
param vNetName string = 'vnet001'

module virtualNetwork 'br/public:avm/res/network/virtual-network:0.4.0' = {
  name: 'virtualNetworkDeployment'
  params: {
    addressPrefixes: ['10.0.0.0/16']

    name: vNetName

    location: location

    subnets: [
      {
        name: 'logicappssn'
        addressPrefix: '10.0.1.0/24'
      }
      {
        name: 'webappssn'
        addressPrefix: '10.0.2.0/24'
      }
      {
        name: 'vmssn'
        addressPrefix: '10.0.3.0/24'
      }
      {
        name: 'generalsn'
        addressPrefix: '10.0.4.0/24'
      }
      {
        name: 'storageaccsn'
        addressPrefix: '10.0.5.0/24'
      }
    ]
  }
}
output vnetid string = virtualNetwork.outputs.resourceId
output logicappssn string = virtualNetwork.outputs.subnetResourceIds[0]
output webappssn string = virtualNetwork.outputs.subnetResourceIds[1]
output vmssn string = virtualNetwork.outputs.subnetResourceIds[2]
output generalsn string = virtualNetwork.outputs.subnetResourceIds[3]
output storageaccsn string = virtualNetwork.outputs.subnetResourceIds[4]

