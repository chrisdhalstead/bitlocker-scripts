# bitlocker-scripts
PowerShell Scripts for Workspace ONE UEM to Configure Bitlocker

These scripts are provided 'as-is' and are not supported by VMware

They should be deployed as Workspace ONE UEM Scripts for Windows 10/11

------

**<u>bitlocker_cipher_strength.ps1</u>** - Set the Encryption Cipher Strength for Bitlocker Enabled Drives (OS, Physical or Removable)

Return Type: String

Run Context: System

Usage:  

​	Update the following lines:

​				`$key_name = "drive-type"` - Which type of drive to set the cipher value for:

​							Values:

​								OS Drive - EncryptionMethodWithXtsOs <br>
​								Fixed Drives - EncryptionMethodWithXtsFdv <br>
​								Removable Drives - EncryptionMethodWithXtsRdv<br>

​								Example:  `$key_name = "EncryptionMethodWithXtsRdv"`<br>

​				  `$ciphervalue = "cipher-value"` - The cipher value

​							Values:

​									AES-CBC 128-bit = 3<br>
​									AES-CBC 256-bit = 4<br>
​									XTS-AES 128-bit (default) - 6<br>
​									XTS-AES 256-bit - 7<br>

​									Example:  `$cipher = "7"`

Output:

![Cipher](https://github.com/chrisdhalstead/bitlocker-scripts/blob/main/Images/cipher1.png)<br>

![Cipher](https://github.com/chrisdhalstead/bitlocker-scripts/blob/main/Images/cipherlog.png)

------

**<u>bitlocker_encryption_type.ps1</u>** - Set the Encryption Type for Bitlocker to go Enabled Removable Drives.	

Return Type: String

Run Context: System

Usage:  

​	Update the following line:

​				`$encryptionvalue = "0"` - How to Encrypt Removable Drives

​							Values:

​							 Allow User To Choose (Default) - 0<br>							 Used Space Only Encryption - 3 <br>
​							 Full Disk Encryption- 4 <br>

​							Example:  `$encryptionvalue  = "4"`<br>Output:

![Encryption](https://github.com/chrisdhalstead/bitlocker-scripts/blob/main/Images/encryption1.png)<br>

![Encryption](https://github.com/chrisdhalstead/bitlocker-scripts/blob/main/Images/encryptionlog.png)

------

