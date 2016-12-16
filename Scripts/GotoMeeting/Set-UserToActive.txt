write-host "Before enable/disable the user of GotoMeeting you should download 2 libraries. Newtonsoft.json.dll and CitrixGotoUserAPI.dll from  https://developer.citrixonline.com/code-samples . Open the link and click on the CitrixGoToProductsUserAPI.zip. Now extract both the dlls and put both the dlls at the same location from where you want to run the script. You should Unblock the dll by clicking right click on dll and then click on the properties menu then click on the Unblock button."

import-Module .\CitrixGotoUserAPI.dll
import-Module .\Newtonsoft.json.dll

$DomainUserName = args[0]
$Password = 'Password'
$EmailId = 'EmailId'

$DomainUserInfo = Get-CitrixGoToUserAPI -AdminUser $DomainUserName -Password $Password
$Connection = Get-CitrixGoToUserAPIByToken $DomainUserInfo.AccessToken GLOBAL

$User = Get-UserByMail $Connection $EmailId
Set-UserToActive $Connection $User.ID
