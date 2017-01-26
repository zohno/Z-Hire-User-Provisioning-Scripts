$ApiKey = 'Api key is here'
$AppKey = 'App key is here'
$UserEmail = args[0]

$Result = Invoke-WebRequest -Uri ("https://app.datadoghq.com/api/v1/user/" + $UserEmail + "?api_key=" + $ApiKey + "&application_key=" + $AppKey+ ""| echo) -body '{"disabled": false}' -ContentType "application/json" -Method PUT
$Result.Content