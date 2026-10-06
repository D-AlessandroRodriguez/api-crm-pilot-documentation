#listar lead individual
curl -L -X POST 'https://api.pilotsolution.net/v1/welcomes/read.php' \
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

#Listar leads
curl -X POST \
'https://api.pilotsolution.net/v1/welcomes/list.php' \
--header 'content-type: application/json' \
--data-raw "{
    \"data\": {
        \"limit\":10,
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
            \"field\": \"welcome_email\",
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

"entitydata": [
                {
                    "id": "1", 
                    "code": "1", 
                    "name": "Nuevo FORD",
                    "business_deleted": "0",
                    "business_visible": 1,
                    "business_visual_order": "1",
                    "audit_dt": "2026-06-23T17:09:18+0000",
                    "audit_usr": "85955",
                    "business_behavior": {"code": "NEW-VEHICLES"},
                    "business_require_product_of_interest": 0},
                }