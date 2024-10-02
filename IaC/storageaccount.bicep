param baseName string = 'sslogic'
var uniqueSuffix = uniqueString(resourceGroup().id)
var generatedName = '${baseName}${uniqueSuffix}'

module storageAccount 'br/public:avm/res/storage/storage-account:0.13.3' = {
  name: 'storageAccountDeployment'
  params: {
    kind: 'StorageV2'
    name: generatedName
    location: resourceGroup().location
    skuName: 'Standard_LRS' 
    allowBlobPublicAccess: false
    accessTier: 'Hot'

    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
  }
}

output storageAccountId string = storageAccount.outputs.resourceId
