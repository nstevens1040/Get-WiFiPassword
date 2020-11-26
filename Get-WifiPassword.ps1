Function Get-WifiPw
{
    [cmdletbinding()]
    Param(
        [string]$Wifi_SSID
    )
    if(!$Wifi_SSID){
        $Wifi_SSID = (Get-NetConnectionProfile).Name
    }
    $pw = [Regex]::new("(\s*)").Replace(@(cmd /c "netsh wlan show profile `"$($Wifi_SSID)`" key=clear 2>&1").Where({$_ -match 'Key Content'})[0].Split(':')[1],'')
    write-host "$($Wifi_SSID)" -ForeGroundColor Yellow -NoNewLine; @(0..("$($Wifi_SSID)".Legnth + 8)).ForEach({ write-host " " -NoNewLine }); write-host "$($pw)" -ForeGroundColor Green
}
