#the product and location
location = "eastus"
product = "cca"
# resource_group_name = "sitl-rg-prod-eus-cca"

event_topic = "eventtopic"
topic_type = "Microsoft.Storage.StorageAccounts"
event_subs = "eventsubscription"
event_schema = "EventGridSchema"
event_types = "Microsoft.Storage.BlobCreated"
webhook_url = "https://ssna-func-cca-prod-eus-wftrigger.azurewebsites.net/runtime/webhooks/EventGrid?functionName=EventGridTrigger\u0026code=HLSjtEvv6b6DThUeRodSsL_PHgRKr_TnL4f2pKZ4SWwSAzFusGZPPw=="