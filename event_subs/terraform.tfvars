#the product and location
location = "eastus"

resource_group_name = "sitl-rg-prod-eus-cca"

event_topic = "eventtopic"
topic_type = "Microsoft.Storage.StorageAccounts"
event_subs = "eventsubscription"
event_schema = "EventGridSchema"
event_types = "Microsoft.Storage.BlobCreated"
# webhook_url = "https://ssna-func-cca-dev-eus-wftrigger.azurewebsites.net/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=z02rzc_deqQ3sHCAT8JKorGnvpxlcg9L2OpIK4tEwn1FAzFuMDqB2g=="