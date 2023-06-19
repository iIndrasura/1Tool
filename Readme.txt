#### Indrasura#0175 ####
######## 1Tool ########
#### Chocolatey Package Manager ####

https://community.chocolatey.org/

- Install Chocolatey Package Manager
Note: If youre using the 1Tool then it will install it automatically no need to install it manually.

command line
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

note: close the power shell after installing

Install Directory of chocolatey: C:\ProgramData\chocolatey
Package library: C:\ProgramData\chocolatey\lib

#### Troubleshoot ####
If package not installing/ You uninstalled the software using different program (Revo/control Panel)
Simply check the library directory and open powershell then uninstall the package again with choco
choco uninstall {package_name}, this will remove it from choco library.
Then it should work again.

#### Guide ####
- Package Search
https://community.chocolatey.org/packages

- Common Commands (Install, Upgrade, Uninstall)
choco install {package_name}
choco upgrade {package_name}
choco uninstall {package_name}

ex: choco install googlechrome

- Multi Package Installer
choco install googlechrome vscode putty 7zip

- Update all packages at once
choco upgrade all -y

#### Update Button #####
Update button will check all the software installed via chocolatey and update them to latest version in just one click.

________________________________________________________

- Graphic Drivers
Installing your graphics drivers via SDIO is not recommended as they can be heavily bloated.
Use NVcleaninstall to debloat your driver and install it.
________________________________________________________
