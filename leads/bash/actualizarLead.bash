curl --location --request POST 'https://api.pilotsolution.net/v1/welcomes/update.php' \ 
--header 'content-type: application/json' \ 
--data-raw '{ 
  "data": {
    "id":"6005B367-D9C9-4A90-AF73-F07BEF5B01EB",
    "suborigin_code": "11",
    "contact_type_code":"LS",
    "business_type_code": "convencional",
    "notes": "Modificando desde la API",
    "provider_url": "http://www.google.com.ar",
    "provider_service": "Google AR"
  },
  "header": {
    "FlowName": "update_prospect",
    "SequenceId": 1,
    "TimeStamp": 1493991052,
    "TrackingId": "55A6BCD4-0857-4A86-85FB-09A228B641B4",
    "access_token":"{{token}}"
  }
}