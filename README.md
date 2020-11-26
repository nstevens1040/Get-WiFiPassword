# Get-WiFiPassword  
If a Wi-Fi password is stored in your "known networks", then this PowerShell function will return the Wi-Fi password given the "WiFi_SSID" parameter.
# Installation  
To make the function available in PowerShell. Launch PowerShell and run the following.  
```ps1
@(Get-ExecutionPolicy -List).Where({
    $_.ExecutionPolicy -ne 'Unrestricted' -and `
    $_.Scope -notin @("Process","UserPolicy","MachinePolicy")
}).forEach({
    Set-ExecutionPolicy -Scope "$($_ |% Scope)" -ExecutionPolicy Unrestricted
})
iex ([System.Net.WebClient]@{Proxy=$null;}).DownloadString("https://raw.githubusercontent.com/nstevens1040/Get-WiFiPassword/main/Get-WifiPassword.ps1")
```  
# Usage  
```ps1
Get-WifiPw [[-Wifi_SSID] <string>]  [<CommonParameters>]
```  
If no argument for **Wifi_SSID** is not provided, then the currently connected Wifi SSID will be selected.  
