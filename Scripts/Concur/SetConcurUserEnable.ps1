$EmpId = Read-Host "Please enter your employee id of the user"
$SamAccountName = args[0]

$headers = @{
    Authorization = "OAuth Zh*******************Is="
}

$results = Invoke-RestMethod -Uri "https://www.concursolutions.com/api/user/v1.0/users" -body ('<batch 

xmlns="http://www.concursolutions.com/api/user/2011/02" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
<UserProfile xmlns="http://www.concursolutions.com/api/user/2011/02" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">
<FeedRecordNumber>1</FeedRecordNumber>
<Active>Y</Active>
<LoginId>di*******24@gmail.com</LoginId>
<FirstName>' + $SamAccountName + '</FirstName>
<LastName>LastName</LastName>
<CtryCode>US</CtryCode>
<LocaleName>en_US</LocaleName>
<CrnKey>USD</CrnKey>
<EmpId>' + $EmpId + '</EmpId>
<EmailAddress>di********24@gmail.com</EmailAddress>
<Password></Password>
<Custom21>US</Custom21>
<LedgerKey></LedgerKey>
</UserProfile>
</batch>' | echo) -ContentType "application/xml" -Headers $headers -Method POST