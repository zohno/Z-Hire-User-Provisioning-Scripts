$UserName = args[0]
$Token = 'Bearer PasteTokenHere'

$Headers = @{
    Authorization = $Token
}
$results = Invoke-RestMethod -Uri ("https://api.box.com/2.0/users") -Headers $headers -Method GET
$Id = ($results.entries | Select-Object -Property name, status,id | Where-Object {$_.name -eq $UserName}).id

Invoke-RestMethod -Uri ("https://api.box.com/2.0/users/"+ $Id + "" | echo) -body '{"status": "active"}' -Headers $headers -Method PUT