module storageAccount 'br/public:avm/res/storage/storage-account:0.13.3' = {
  name: 'storageAccountDeployment'
  params: {
    // Required parameters
    name: 'ssamin001'
    // Non-required parameters
    allowBlobPublicAccess: false
    location: '<location>'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
  }
}
