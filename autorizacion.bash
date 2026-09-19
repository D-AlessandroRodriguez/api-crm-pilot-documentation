 sudo curl -X POST --url 'https://api.pilotsolution.net/v1/users/auth.php?username=informatica5@grupoyc.com&password=Yude2026.' | jq

 TOKEN=$(curl -s -X POST --url 'https://api.pilotsolution.net/v1/users/auth.php?username=informatica5@grupoyc.com&password=Yude2026.' \
| jq -r '.result.entitydata')