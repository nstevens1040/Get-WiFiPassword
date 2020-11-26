Function Get-WifiPw
{
    [cmdletbinding()]
    Param(
        [string]$Wifi_SSID
    )
    return [Regex]::new("(\s*)").Replace(@(cmd /c "netsh wlan show profile `"$($Wifi_SSID)`" key=clear 2>&1").Where({$_ -match 'Key Content'})[0].Split(':')[1],'')
}
