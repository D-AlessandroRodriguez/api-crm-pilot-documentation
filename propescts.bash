"data": {
            "id": "7F66BDCE-9E26-4497-9411-7504E79971AE"
        },
  "header": {
  "FlowName": "read_prospect",
  "SequenceId": [],
  "TimeStamp": [],
  "access_token":"{{token}}"
  }
}

#leer datos de un solo prospecto
curl -X POST \
'https://api.pilotsolution.net/v1/prospects/read.php' \
--header 'content-type: application/json' \
--data-raw "{
    \"data\": {
              \"id\": \"6B4774C5-7A05-428C-B6E9-796FFA9F0BA2\"        
    },
    \"header\": {
        \"FlowName\": \"read_prospect\",
        \"SequenceId\": [],
        \"TimeStamp\": [],
        \"access_token\": \"$TOKEN\"
    }
}" | jq

#Leer la lista de prospectos
curl -X POST \
'https://api.pilotsolution.net/v1/prospects/list.php' \
--header 'content-type: application/json' \
--data-raw "{
    \"data\": {
        \"limit\": 100,
        \"page\": 1,
        \"filters\": [
            [\"gender_code\", \"=\", \"E\"],
            [\"created\", \">\", \"2026-7-01T00:00:00.000\"]
        ],
        \"sorts\": {
            \"field\": \"updated\",
            \"order\": \"DESC\"
        }
    },
    \"header\": {
        \"FlowName\": \"List_Leads\",
        \"SequenceId\": [],
        \"TimeStamp\": [],
        \"access_token\": \"$TOKEN\"
    }
}" | jq

curl -X POST \
'https://api.pilotsolution.net/v1/prospects/read.php' \
--header 'content-type: application/json' \
--data-raw "{
    \"data\":{
        \"limit\":\"2\",
        \"page\":\"1\"
    },
    \"header\":{
        \"FlowName\":\"list_prospect\",
        \"SequenceId\":[],
        \"TimeStamp\":[],
        \"access_token\":\"$TOKEN\"
    }
}" | jq
