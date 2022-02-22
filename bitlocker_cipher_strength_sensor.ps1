# PowerShell Sensor to Set Bitlocker Cipher Strength
# Return Type: String
# Context: System

# Name of Registry Key of Bitlocker Drive to Update
#
# OS Drive - EncryptionMethodWithXtsOs
# Fixed Drives - EncryptionMethodWithXtsFdv
# Removable Drives - EncryptionMethodWithXtsRdv

# Cipher Strength Values to Change To
#
# AES-CBC 128-bit - 3
# AES-CBC 256-bit - 4
# XTS-AES 128-bit (default) - 6
# XTS-AES 256-bit - 7

#####################################################################################################

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

####### Update the following varables to determine which type of drive and what cipher strength are used
####### It is currently set to Removable Drives with XTS-AES 256-bit cipher strength

$key_name = "EncryptionMethodWithXtsRdv"
$ciphervalue = "7"

###### End Update

$output = ""

$hash = $null
$hash = @{}
$hash.add("3","AES-CBC 128-bit")
$hash.add("4","AES-CBC 256-bit")
$hash.add("6","XTS-AES 128-bit (default)")
$hash.add("7","XTS-AES 256-bit")


$hashdrives = $null
$hashdrives = @{}
$hashdrives.add("EncryptionMethodWithXtsOs","OS Drive")
$hashdrives.add("EncryptionMethodWithXtsFdv","Fixed Data Drives")
$hashdrives.add("EncryptionMethodWithXtsRdv","Removable Drives")

IF(!(Test-Path $registryPath))

{
    
    $output = "The registry key " + $registryPath + " Cannot Be Found"
    Write-Output $output
    Exit
}

$valuepath = $registryPath + "\" + $key_name

if (!(Test-Path $valuepath)) 

                {

                    New-ItemProperty -Path $registryPath -Name $key_name -Force | Out-Null

                    New-ItemProperty -Path $registryPath -Name $key_name -Value $ciphervalue -PropertyType DWORD -Force | Out-Null
 
                    $output = "Set Bitlocker Cipher for " + $hashdrives[$key_name] + " to: "

                    $cvalue = (Get-ItemProperty -Path $registryPath -Name $key_name).$key_name
                    $readable = $hash["$cvalue"]

                    $output = $output + $readable
                    Write-Output $output

                }


        else {
                
            $output = "New Bitlocker Cipher for " + $hashdrives[$key_name] + " to: "

            $cvalue = Get-ItemProperty -Path $registryPath -Name $key_name.$key_name
            $readable = $hash["$cvalue"]

            $output = $output + $readable
            Write-Output $output

                    
             }







