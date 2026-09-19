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

curl -s --location --request GET 'https://api.pilotsolution.net/v1/masters/read.php' \
--header 'content-type: application/json' \
--header 'Cookie: PHPSESSID=sidnnmj6jeqku800hu22juf5j1' \
--data-raw ' {"data": {
		"master": "workshop_model"	
	},"header": {
		"FlowName": "masterdata_read",
		"SequenceId": 2,
		"TimeStamp": 1248377,
		"TrackingId": "55A6BCD4-0857-4A86-85FB-09A228B641B4",
		"access_token": "NHNmVnVTVFAzd3NjK1I2clh1eDdGMEdoVndNVTMvbnhPeHB4SlBIUW1GaEx2N2lZRjJ4cE9NKzBMYzRjdkh6ayt5WVlmc0ltNWl2YWlDWnhUb21FaERMRWp4eVdlRENCc3htZFdQbnYraXozWkQzYmxsWWV4emN1WWhxY2JlMTBYM0dDcVo1ZGo1MGo0T0YrOEcvTFBmSlVXV1NSN3ViSnV6cGt6ckI4RDFsQkhYNmNabUwrVDdKTWc3T2srQVhOMmx2Mm1tMWc2TlNKV2FyUjVqMkloQ0YrUnRBdzh4SmJTZjR6KzJCVVk1alA1WXc1SHBLYlZOWkZKTlBCbFUvcWdycHdRSWVkZkVmSzhPRkZ6L21NbFZEMVhzQWdOb0UzeHlHTDNFYUw0c0FNRWxFZm9RNVJ3NHhVOGc0NFp0bXhmbDlIZVZVQ3NwMVdLRDAvcU8raWRNb0g2bEQ4MjVWT3h6Y1kxQ29XQnhqckttRUg0eXgva1B6TG9NL3VFeXpIUkJiWU5nZzRTQXBJNmswNEp0YWhFWGhaWUVydXBkZ3gwMjR2VzB3dWY5L3FtUUJTL2FrZ0Q1bnFqUGpkeFowUGxYSE4zbzZyTkFTTHprZXpUMmlJdEhqeWllaE0zSE5NbWpORWgrRHVYVXhRRXNCcXlCZnBzTERodWRrbkI5YWprRHI4aHFHOGsyTmdyRVJVS0E4WWtNNlMxM0xmeGN4OUNudUtCK1BLVHdoYWlsL1JXclJPa0Z5SUxiUFRDbWJTQVJYZVlwNnVXcnBTWmZ2VTI4eW9rdjdnT05oNlU2My9ubCs4ZkVxbmxEWXZvNmVNK2xNVjJ0eHd1VGVnUkZIMmlYRjBFNngxNjgxZWFaanZ3bVhsV29HNGlKclFLL04zMlk1SkxUbE9IaXZRd1ZCQytzRGtXcFN0Sm5XT1Y2UGdzMHpRbWp0NkFPNm5pYjRyTXBLWGxOMU9qU1pCcjQvWUh5Wk9UUlp5bG1WRkhJYVJPbDhwY2lPQkJGTVVscFpQOG1EUnZzSm1nU2xISVZOVjErRGpQTmhHRWRPcTRCWW9rdGlIUEhzUnI2Vk9Cbk1sa1VMdW11Qjg3WEtRZ3JTa0RnRkFXYlBaYjJ1b3hFSkp0YWNiOWh3aEwrUEZ0YmhtVXZlNUN5VnRSOENDZUpaUVFRTm4wWGpQQy92enV6ajFvVlZCbVFKajMyRThlN2UvVUxnR1pkYmQyT3JGaEZ3TVhMUFN1ajg3dmliN2xYcEF1aGJsWjFhbEV6bVVEMTl6QVNIUlo4VmxPS2ZEd0hocDRkdS9DN2h3OGJMTWZRV1BrdU00K0RaUlZqbFgvbmcrZmhGcjFSQ0xVQkhpR294NEU0MnRUU3JiNGNNQUtOU0VKMTNzcktzV01yQTg5UXhCZWRlbnBKbFZ1ck44dTc0a1FRYkppNnNkMnNKdnJlUlNRc2h1ZnNEZHVqMnRRZ1pBT3J5RGM4aXo4RXpqNkd4b0p2RE5mTG9pcFluMUMzOVNnd1FBeGZmM0k5ZFhyejduVGZsdjc0b1VMZmpRemtpZmxkOTNxWE4zRDZ2VmJka1RaVTVHZzJ6RXRCVWREUnlrSjFJNUF2TkV1SGZ0Y3RlVFl5b2gvdWk3OHBYcUZZTkRoRkdZa2VNZ1plUEcwdzV4MjhuMVBEK3ZrWlJHVE16T21NeTU4MGVBdStzOVVrK0ZvOGRhKzVPYkUzYXp5RGZhRmFjWGlIS2RtZGVpc3NPZTBEOTlzbk1qUE8zOHRrelBaYlRRYUFJM3VHdFVOc2xpaG1PM0VTQTIvREpkM29DdmYzMDVWTmMrVmpNMlhWWWRjK2VBL2tsZVJzdThXOGpBL1F5RmtBT2NSWkdSYW5DdUVEVEpFOE1CRVdXMVhWSERMQzhjNkg2OUJLbDNoY3RtWWw0RjIzeDUvc0xjd213REN3ZXlmWjBydGZUUUdoZmlRdEFzaUl4Uzc3S2s5VzNaMWlCTm1nPT0=:"
	}}' | jq


#\"id\": \"7F66BDCE-9E26-4497-9411-7504E79971AE\"

curl -X POST \
'https://api.pilotsolution.net/v1/prospects/read.php' \
--header 'content-type: application/json' \
--data-raw "{
    \"data\": {
              \"email\": \"dalesandro2002@gmail.com\"          
    },
    \"header\": {
        \"FlowName\": \"read_prospect\",
        \"SequenceId\": [],
        \"TimeStamp\": [],
        \"access_token\": \"$TOKEN\"
    }
}" | jq

#Expomovil SPS
#Expomovil TGU
#Reporte de performance es para ver la tasa de conversion a venta de un lead LCR

\"data\": {
            \"id\": \"7F66BDCE-9E26-4497-9411-7504E79971AE\"
        },
  \"header\": {
  \"FlowName\": \"read_prospect\",
  \"SequenceId\": [],
  \"TimeStamp\": [],
  \"access_token\":"{{token}}"
  }
}