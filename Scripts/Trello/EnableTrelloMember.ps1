﻿$UserName = args[0]
$Organization = 'Organization name is here'
$ApiKey = 'Api Key'
$Token = 'Token'

$results = Invoke-RestMethod -Uri ("https://api.trello.com/1/organizations/" + $Organization + "/members/" + $UserName + "?key=" + $ApiKey + "&token=" + $Token + "&type=normal"|echo) -Method PUT