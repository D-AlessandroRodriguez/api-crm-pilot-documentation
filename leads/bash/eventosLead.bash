#lead de prueba 6B4774C5-7A05-428C-B6E9-796FFA9F0BA2

#crear
{
            "comment": {
                "text": "Text comentario del evento",
                "relevance": 'normal|hight'
            },
            "components": [
                 {
                    "type": 'map',
                    "lat": -34.676398,
                    "long": -58.353870
                }
            ]
        }
}

#listar eventos
curl -X POST 'https://api.pilotsolution.net/v1/welcomes/events/list.php' \
--header 'content-type: application/json' \
--data-raw "{
	\"data\": {
		\"id\" : \"6B4774C5-7A05-428C-B6E9-796FFA9F0BA2\",
		\"filter\": [
		   {
		      \"field\": \"welcome_event_code\",
		      \"operation\": \"=\",
		      \"value\": \"4\"
		   }
		 ],
	 	\"sort\": [
 		   {
		      \"field\": \"welcome_event_dt\",
		      \"order\": \"DESC\"
		   }
		 ],
		 \"limit\": 50,
		 \"page\": 1
	},
	\"header\": {
		\"FlowName\": \"welcomes_event_list\",
		\"SequenceId\": [],
		\"TimeStamp\": [],
		\"TrackingId\": \"\",
		\"access_token\":\"$TOKEN\"
	}
}" | jq