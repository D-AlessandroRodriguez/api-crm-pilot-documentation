curl --location --request POST 'https://api.pilotsolution.net/v1/welcomes/close.php' \ 
--header 'content-type: application/json' \ 
--data-raw '{ 
"data": {
    "id":"6005B367-D9C9-4A90-AF73-F07BEF5B01EB",
    "desist_status_code": "5",
    "desist_comments": "Obtuvo una mejor oferta"
  },
  "header": {
    "FlowName": "LEAD_CLOSE_PILOT",
    "SequenceId": 1,
    "TimeStamp": 1493991052,
    "TrackingId": "55A6BCD4-0857-4A86-85FB-09A228B641B4",
    "access_token":"{{token}}"
  }
}