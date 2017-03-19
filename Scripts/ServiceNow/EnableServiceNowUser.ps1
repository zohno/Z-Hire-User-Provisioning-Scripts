$SamAccountName = args[0]
$NowInstance = 'Your Instance'
$SNowUser = 'User Name'
$Password = 'Enter your password here'
$SNowPass = ConvertTo-SecureString –String $Password –AsPlainText -Force
$SNowCreds = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $SNowUser, $SNowPass
$headers = @{
"Accept" = "application/json"
}

$Results = Invoke-RestMethod -Credential $SNowCreds -Headers $headers -Method Get -Uri ("https://" + $NowInstance + ".service-now.com/api/now/table/sys_user?name=" + $SamAccountName + "" | echo) -ContentType "application/json"

$SysUserId = $Results.result.sys_id

Invoke-RestMethod -Credential $SNowCreds -Headers $headers -Body '{"active": "true"}' -Method Put -Uri ("https://" + $NowInstance + ".service-now.com/api/now/v1/table/sys_user/" + $SysUserId + "" | echo) -ContentType "application/json"