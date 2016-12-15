[Reflection.Assembly]::LoadWithPartialName( "System.IO.Compression.FileSystem" )

$SamAccountName = = args[0]
$DesPath = args[1]
$DesHomePath = args[2]


$UserProperties = Get-ADUser $SamAccountName -properties scriptpath, homedrive, homedirectory, profilepath
$UserProfilePath = $UserProperties.ProfilePath
$UserHomeDirectory = $UserProperties.HomeDirectory

$V2 = ".V2"
$V3 = ".V3"
$V5 = ".V5"
$Ext= ".zip"

$DesPathCheck = Test-Path $DesPath
$DesHomePathCheck = Test-Path $DesHomePath

if($DesPathCheck -eq $False){ mkdir $DesPath}
if($DesHomePathCheck -eq $False){ mkdir $DesHomePath}

$UserProfilePathCheck = Test-Path $UserProfilePath
$UserProfilePathCheckV2 = Test-Path ($UserProfilePath + $V2)
$UserProfilePathCheckV3 = Test-Path ($UserProfilePath + $V3)
$UserProfilePathCheckV5 = Test-Path ($UserProfilePath + $V5)

$UserHomePathCheck = Test-Path $UserHomeDirectory
$UserHomePathCheckV2 = Test-Path ($UserHomeDirectory + $V2)
$UserHomePathCheckV3 = Test-Path ($UserHomeDirectory + $V3)
$UserHomePathCheckV5 = Test-Path ($UserHomeDirectory + $V5)

if($UserProfilePathCheck -eq $True){[io.compression.zipfile]::CreateFromDirectory($UserProfilePath, $DesPath + $SamAccountName+ $Ext) }
if($UserProfilePathCheckV2 -eq $True){[io.compression.zipfile]::CreateFromDirectory($UserProfilePath + $V2, $DesPath + $SamAccountName+ $V2 + $Ext) }
if($UserProfilePathCheckV3 -eq $True){[io.compression.zipfile]::CreateFromDirectory($UserProfilePath + $V3, $DesPath + $SamAccountName+ $V3 + $Ext) }
if($UserProfilePathCheckV5 -eq $True){[io.compression.zipfile]::CreateFromDirectory($UserProfilePath + $V5, $DesPath + $SamAccountName+ $V5 + $Ext) }

if($UserHomePathCheck -eq $True){[io.compression.zipfile]::CreateFromDirectory($UserHomeDirectory, $DesHomePath + $SamAccountName+ $Ext) }
if($UserHomePathCheckV2 -eq $True){[io.compression.zipfile]::CreateFromDirectory($UserHomeDirectory + $V2, $DesHomePath + $SamAccountName+ $V2 + $Ext) }
if($UserHomePathCheckV3 -eq $True){[io.compression.zipfile]::CreateFromDirectory($UserHomeDirectory + $V3, $DesHomePath + $SamAccountName+ $V3 + $Ext) }
if($UserHomePathCheckV5 -eq $True){[io.compression.zipfile]::CreateFromDirectory($UserHomeDirectory + $V5, $DesHomePath + $SamAccountName+ $V5 + $Ext) }