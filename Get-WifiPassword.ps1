Function Get-WifiPw
{
    [cmdletbinding()]
    Param(
        [string]$Wifi_SSID
    )
    if(!$Wifi_SSID){
        $Wifi_SSID = (Get-NetConnectionProfile).Name
    }
    return [Regex]::new("(\s*)").Replace(@(cmd /c "netsh wlan show profile `"$($Wifi_SSID)`" key=clear 2>&1").Where({$_ -match 'Key Content'})[0].Split(':')[1],'')
}
