param location string = resourceGroup().location
param namePrefix string = 'hello'
param nameForResources string = '${namePrefix}${uniqueString(resourceGroup().id)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: nameForResources
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: nameForResources
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

resource webApplication'Microsoft.Web/sites@2023-12-01' = {
  name: nameForResources
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

