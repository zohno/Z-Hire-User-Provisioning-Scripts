$SamAccountName = args[0]
$UserName = '********'
$Password = '********'
$SiteId = '123456'
$DomainName = 'YourServerNameIsHere'

Invoke-WebRequest -Uri ('https://' + $DomainName + '.webex.com/WBXService/XMLService' | echo) -body ('<?xml version="1.0" encoding="ISO-8859-1"?><serv:message xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><header>
<securityContext>
	<webExID>' + $UserName + '</webExID>
	<password>' + $Password + '</password>
	<siteID>' + $SiteId + '</siteID>
</securityContext>
</header><body><bodyContent xsi:type="java:com.webex.service.binding.user.SetUser">
	<webExId>' + $SamAccountName + '</webExId>
	<active>ACTIVATED</active>
</bodyContent></body></serv:message>' | echo) -Method POST