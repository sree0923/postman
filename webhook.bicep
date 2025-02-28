param topics_MHSJanusNotification_DEV_Public_name string = 'MHSJanusNotification-DEV-Public-as'

resource topics_MHSJanusNotification_DEV_Public_name_resource 'Microsoft.EventGrid/topics@2024-06-01-preview'  existing = {
  name: topics_MHSJanusNotification_DEV_Public_name
}

resource topics_MHSJanusNotification_DEV_Public_name_Client_3091f1fa_9f0b_4974_a06f_0169f1e26039 'Microsoft.EventGrid/topics/eventSubscriptions@2024-06-01-preview' = {
  parent: topics_MHSJanusNotification_DEV_Public_name_resource
  name: 'Client-3091f1fa-9f0b-4974-a06f-0169f1e26039'
  properties: {
    destination: {
      properties: {
        endpointUrl: 'https://prod-23.eastus.logic.azure.com/workflows/a50fae3b15fb4f3d90078fb4925704e3/triggers/manual/paths/invoke'
        maxEventsPerBatch: 1
        preferredBatchSizeInKilobytes: 64
        minimumTlsVersionAllowed: '1.2'
      }
      endpointType: 'WebHook'
    }
    filter: {
      subjectBeginsWith: '/121d3034-ee35-4c1a-9228-fad59b58cc1f'
      enableAdvancedFilteringOnArrays: true
    }
    labels: []
    eventDeliverySchema: 'CloudEventSchemaV1_0'
    retryPolicy: {
      maxDeliveryAttempts: 30
      eventTimeToLiveInMinutes: 1440
    }
  }
}



