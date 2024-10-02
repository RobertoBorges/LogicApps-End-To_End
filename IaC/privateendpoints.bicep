@description('Subnet Resource ID where the Private Endpoint will be deployed')
param subnetResourceId string


@description('Private Endpoint Deployment')
param name string = 'npemin001'

@description('Private Endpoint Deployment')
param privateLinkServiceId string

module privateEndpoint 'br/public:avm/res/network/private-endpoint:0.8.0' = {
  name: 'privateEndpointDeployment'
  params: {

    name: name
    subnetResourceId: subnetResourceId

    location: resourceGroup().location

    privateLinkServiceConnections: [
      {
        name: name
        properties: {
          groupIds: [
            'blob'
          ]
          privateLinkServiceId: privateLinkServiceId
        }
      }
    ]
  }
}
