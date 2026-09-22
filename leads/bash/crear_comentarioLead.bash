curl --location --request GET 'https://api.pilotsolution.net/v1/welcomes/comments/create.php' \
--header 'content-type: application/json' \
--data-raw '{
	"data": {
		"id" : "D3263CCF-F425-4F6E-AD87-6DGHF1834523",
		"comment": "Texto del nuevo comentario"
	},
	"header": {
		"FlowName": "lead_comment_create",
		"SequenceId": [],
		"TimeStamp": [],
		"TrackingId": "2B50DDB4-14C5-4249-82AB-049E6E735AA1",
		"access_token":"{{token}}"
	}
}