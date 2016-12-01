$user = 'xyz@gmail.com'
$pass= '***'
$SamAccountName = args[0]
$pair = "$($user):$($pass)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

$Result = Invoke-WebRequest -Uri 'https://{subdomain}.zendesk.com/api/v2/search.json?query=type:user "Balram"' -Headers $Headers


$x = $Result.Content | ConvertFrom-Json
$x.results




























































