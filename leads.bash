curl -X POST \
'https://api.pilotsolution.net/v1/welcomes/read.php' \
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


curl -X POST \
'https://api.pilotsolution.net/v1/welcomes/list.php' \
--header 'content-type: application/json' \
--data-raw "{
    \"data\": {
        \"limit\": 20,
        \"page\": 1,
        \"filters\": [
            {
                \"field\": \"welcome_cellphone\",
                \"operation\": \"LIKE\",
                \"value\": \"93579222\"
            }
        ],
        \"wildCard\": \"*\",
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