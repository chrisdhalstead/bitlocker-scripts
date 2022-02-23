# PowerShell Script to Set Bitlocker Removable Drive Encryption Type
# Return Type: String
# Context: System

# Name of Registry Key of Bitlocker Drive to Update
#
# Removable Drives - RDVEncryptionType

# Encryption type:
#
# Allow User To Choose (Default) - 0
# Used Space Only Encryption - 3
# Full Disk Encryption- 4

#####################################################################################################

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$key_name = "RDVEncryptionType"


## Start Update - Update the value based on the Encryption Types Above
## It is currently set to "Allow User To Choose (Default)"
$encryptionvalue = "0"

$output = ""

$hash = $null
$hash = @{}
$hash.add("0","Allow User To Choose (Default)")
$hash.add("1","Full Disk Encryption")
$hash.add("2","Used Space Only Encryption")

$hashdrives = $null
$hashdrives = @{}
$hashdrives.add("RDVEncryptionType","Removable Drives")

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

                    New-ItemProperty -Path $registryPath -Name $key_name -Value $encryptionvalue -PropertyType DWORD -Force | Out-Null
 
                    $output = "Set Bitlocker Encryption Type for " + $hashdrives[$key_name] + " to: "

                    $evalue = (Get-ItemProperty -Path $registryPath -Name $key_name).$key_name
                    $readable = $hash["$evalue"]

                    $output = $output + $readable
                    Write-Output $output

                }


        else {
                
            $output = "Set Bitlocker Encryption Type for " + $hashdrives[$key_name] + " to: "

            $evalue = Get-ItemProperty -Path $registryPath -Name $key_name.$key_name
            $readable = $hash["$evalue"]

            $output = $output + $readable
            Write-Output $output

                    
             }







