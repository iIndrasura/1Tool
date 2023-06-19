# Require admin privileges if User Account Control (UAC) is enabled
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Start-Process PowerShell "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$ErrorActionPreference = 'SilentlyContinue'

[int] $global:column = 0
[int] $maxColumn = 1
[int] $separate = 30
[int] $global:lastPos = 50
[bool]$global:install = $false

function generate_checkbox {
    param(
        [string]$checkboxText,
        [string]$package,
        [bool]$enabled = $true
    )
    $checkbox = new-object System.Windows.Forms.checkbox
    if ($global:column -ge $maxColumn) {
        $checkbox.Location = new-object System.Drawing.Size(($global:column * 300), $global:lastPos)
        $global:column = 0
        $global:lastPos += $separate
    }
    else {
        $checkbox.Location = new-object System.Drawing.Size(30, $global:lastPos)
        $global:column = $column + 1
    }
    $checkbox.Size = new-object System.Drawing.Size(250, 18)
    $checkbox.Text = $checkboxText
    $checkbox.Name = $package
    $checkbox.Enabled = $enabled
    
    $checkbox
}

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

# Set the size of your form
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Install Software | indrasura" # Titlebar
$Form.ShowIcon = $false
$Form.MaximizeBox = $false
$Form.MinimizeBox = $false
$Form.Size = New-Object System.Drawing.Size(600, 210)
$Form.AutoSizeMode = 0
$Form.KeyPreview = $True
$Form.SizeGripStyle = 2

# Label
$Label = New-Object System.Windows.Forms.label
$Label.Location = New-Object System.Drawing.Size(11, 15)
$Label.Size = New-Object System.Drawing.Size(255, 15)
$Label.Text = "Download and install software using Chocolatey:"
$Form.Controls.Add($Label)

# https://community.chocolatey.org/packages/sdio
$Form.Controls.Add((generate_checkbox "Snappy Driver Installer Origin" "sdio"))

# https://community.chocolatey.org/packages/brave
$Form.Controls.Add((generate_checkbox "Brave Browser" "brave"))

# https://community.chocolatey.org/packages/GoogleChrome
$Form.Controls.Add((generate_checkbox "Google Chrome" "googlechrome"))

# https://community.chocolatey.org/packages/Firefox
$Form.Controls.Add((generate_checkbox "Mozilla Firefox" "firefox"))

# https://community.chocolatey.org/packages/adblockpluschrome
$Form.Controls.Add((generate_checkbox "Adblock Plus Extention for Chrome/ Brave" "adblockpluschrome"))

# https://community.chocolatey.org/packages/ublockorigin-chrome
$Form.Controls.Add((generate_checkbox "uBlock Origin Extention for Chrome/ Brave" "ublockorigin-chrome"))

# https://community.chocolatey.org/packages/sponsorblock-for-youtube-chrome
$Form.Controls.Add((generate_checkbox "SponsorBlock Extention for Chrome/ Brave" "sponsorblock-for-youtube-chrome"))

# https://community.chocolatey.org/packages/qbittorrent
$Form.Controls.Add((generate_checkbox "QBittorrent" "qbittorrent"))

# https://community.chocolatey.org/packages/discord
$Form.Controls.Add((generate_checkbox "Discord" "discord"))

# https://community.chocolatey.org/packages/telegram.install
$Form.Controls.Add((generate_checkbox "Telegram (Install)" "telegram.install"))

# https://community.chocolatey.org/packages/steam
$Form.Controls.Add((generate_checkbox "Steam" "steam"))

# https://community.chocolatey.org/packages/ea-app
$Form.Controls.Add((generate_checkbox "EA App" "ea-app"))

# https://community.chocolatey.org/packages/epicgameslauncher
$Form.Controls.Add((generate_checkbox "Epic Games Launcher" "epicgameslauncher"))

# https://community.chocolatey.org/packages/bluestacks
$Form.Controls.Add((generate_checkbox "BlueStacks" "bluestacks"))

# https://community.chocolatey.org/packages/razer-synapse-3
$Form.Controls.Add((generate_checkbox "Razer Synapse 3" "razer-synapse-3"))

# https://community.chocolatey.org/packages/lghub
$Form.Controls.Add((generate_checkbox "Logitech G HUB" "lghub"))

# https://community.chocolatey.org/packages/vlc
$Form.Controls.Add((generate_checkbox "VLC" "vlc"))

# https://community.chocolatey.org/packages/7zip
$Form.Controls.Add((generate_checkbox "7-Zip" "7zip"))

# https://community.chocolatey.org/packages/spotify
$Form.Controls.Add((generate_checkbox "Spotify" "spotify"))

# https://community.chocolatey.org/packages/obs-studio
$Form.Controls.Add((generate_checkbox "OBS Studio" "obs-studio"))

# https://community.chocolatey.org/packages/libreoffice-fresh
$Form.Controls.Add((generate_checkbox "LibreOffice" "libreoffice-fresh"))

# https://community.chocolatey.org/packages/okular
$Form.Controls.Add((generate_checkbox "Okular" "okular"))

# https://community.chocolatey.org/packages/notepadplusplus
$Form.Controls.Add((generate_checkbox "Notepad++" "notepadplusplus"))

# https://community.chocolatey.org/packages/kate
$Form.Controls.Add((generate_checkbox "Kate" "kate"))

# https://community.chocolatey.org/packages/visualstudio2022enterprise
$Form.Controls.Add((generate_checkbox "Visual Studio 2022 Enterprise" "visualstudio2022enterprise"))

# https://community.chocolatey.org/packages/vscode
$Form.Controls.Add((generate_checkbox "Visual Studio Code" "vscode"))

# https://community.chocolatey.org/packages/anydesk.install
$Form.Controls.Add((generate_checkbox "AnyDesk MSI (Install)" "anydesk.install"))

# https://community.chocolatey.org/packages/GitHub
$Form.Controls.Add((generate_checkbox "GitHub Desktop" "github"))

# https://community.chocolatey.org/packages/vmwareworkstation
$Form.Controls.Add((generate_checkbox "VMware Workstation Pro" "vmwareworkstation"))

# https://community.chocolatey.org/packages/virtualbox
$Form.Controls.Add((generate_checkbox "VirtualBox" "virtualbox"))

# https://community.chocolatey.org/packages/msiafterburner
$Form.Controls.Add((generate_checkbox "MSI Afterburner" "msiafterburner"))

# https://community.chocolatey.org/packages/bulk-crap-uninstaller
$Form.Controls.Add((generate_checkbox "Bulk Crap Uninstaller" "bulk-crap-uninstaller"))

# https://community.chocolatey.org/packages/cpu-z
$Form.Controls.Add((generate_checkbox "CPU-Z" "cpu-z"))

# https://community.chocolatey.org/packages/gpu-z
$Form.Controls.Add((generate_checkbox "GPU-Z" "gpu-z"))

# https://community.chocolatey.org/packages/hwinfo
$Form.Controls.Add((generate_checkbox "HWiNFO" "hwinfo"))

# https://community.chocolatey.org/packages/directx
$Form.Controls.Add((generate_checkbox "DirectX" "directx"))

# https://community.chocolatey.org/packages/vcredist140
$Form.Controls.Add((generate_checkbox "Visual C++ Redistributable 2015-2022" "vcredist140"))

# https://community.chocolatey.org/packages/vcredist2013
$Form.Controls.Add((generate_checkbox "Visual C++ Redistributable 2013" "vcredist2013"))

# https://community.chocolatey.org/packages/vcredist2012
$Form.Controls.Add((generate_checkbox "Visual C++ Redistributable 2012" "vcredist2012"))

# https://community.chocolatey.org/packages/vcredist2010
$Form.Controls.Add((generate_checkbox "Visual C++ Redistributable 2010" "vcredist2010"))

# https://community.chocolatey.org/packages/vcredist2010
$Form.Controls.Add((generate_checkbox "Visual C++ Redistributable 2010" "vcredist2010"))

# https://community.chocolatey.org/packages/vcredist2008
$Form.Controls.Add((generate_checkbox "Visual C++ Redistributable 2008" "vcredist2008"))

if ($global:column -ne 0) {
    $global:lastPos += $separate
}

$Form.height = $global:lastPos + 80

# Dark Mode/Light Mode Toggle
$ToggleBtn = New-Object System.Windows.Forms.Button
$ToggleBtn.Location = New-Object System.Drawing.Point(500, 20)
$ToggleBtn.Size = New-Object System.Drawing.Size(80, 23)
$ToggleBtn.Text = "Dark Mode"
$ToggleBtn.Add_Click({
if ($this.Text -eq "Dark Mode") {
    $this.Text = "Light Mode"
    $Form.BackColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
    $Form.ForeColor = [System.Drawing.Color]::White
    foreach ($control in $Form.Controls) {
        if ($control.GetType().Name -eq "Checkbox") {
            $control.BackColor = [System.Drawing.Color]::FromArgb(64, 64, 64)
            $control.ForeColor = [System.Drawing.Color]::White
        }
    }
} else {
    $this.Text = "Dark Mode"
    $Form.BackColor = [System.Drawing.Color]::White
    $Form.ForeColor = [System.Drawing.Color]::Black
    foreach ($control in $Form.Controls) {
        if ($control.GetType().Name -eq "Checkbox") {
            $control.BackColor = [System.Drawing.Color]::White
            $control.ForeColor = [System.Drawing.Color]::Black
        }
    }
}
})
$Form.Controls.Add($ToggleBtn)

# Install Button
$lastPosWidth = $form.Width - 80 - 31
$InstallButton = new-object System.Windows.Forms.Button
$InstallButton.Location = new-object System.Drawing.Size($lastPosWidth, $global:lastPos)
$InstallButton.Size = new-object System.Drawing.Size(80, 23)
$InstallButton.Text = "Install"
$InstallButton.Add_Click({
    $checkedBoxes = $Form.Controls | Where-Object { $_ -is [System.Windows.Forms.Checkbox] -and $_.Checked }
    if ($checkedBoxes.Count -eq 0) {
        [System.Windows.Forms.MessageBox]::Show("Please select at least one software package to install.", "No package selected", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
    else {
        $global:install = $true
        $Form.Close()
    }
})
$Form.Controls.Add($InstallButton)

# Update Button
$lastPosWidth = $form.Width - 80 - 31
$UpdateButton = New-Object System.Windows.Forms.Button
$UpdateButton.Location = New-Object System.Drawing.Point(10, $InstallButton.Top)
$UpdateButton.Size = New-Object System.Drawing.Size(80, 23)
$UpdateButton.Text = "Update"

$Form.Controls.Add($UpdateButton)

# Action for the Update Button
$UpdateAction = {
    Write-Host "$Env:ProgramData\chocolatey\choco.exe upgrade all -y"
    Start-Process -FilePath "$Env:ProgramData\chocolatey\choco.exe" -ArgumentList "upgrade all -y " -Wait
}

$UpdateButton.Add_Click($UpdateAction)

# Activate the form
$Form.Add_Shown({ $Form.Activate() })
[void] $Form.ShowDialog()

if ($global:install) {
    $installPackages = [System.Collections.ArrayList]::new()
    $installSeparatedPackages = [System.Collections.ArrayList]::new()
    $Form.Controls | Where-Object { $_ -is [System.Windows.Forms.Checkbox] } | ForEach-Object {
        if ($_.Checked) {
            if ($_.Name.contains("--")) {
                [void]$installSeparatedPackages.Add($_.Name)
            }
            else {
                [void]$installPackages.Add($_.Name)
            }
        }
    }

    if ($installPackages.count -ne 0) {
        Write-Host "$Env:ProgramData\chocolatey\choco.exe install $($installPackages -join ' ') -y"
        Start-Process -FilePath "$Env:ProgramData\chocolatey\choco.exe" -ArgumentList "install $($installPackages -join ' ') -y --ignore-checksums" -Wait
    }
    if ($installSeparatedPackages.count -ne 0) {
        foreach ($paket in $installSeparatedPackages) {
            Write-Host "$Env:ProgramData\chocolatey\choco.exe install $paket -y"
            Start-Process -FilePath "$Env:ProgramData\chocolatey\choco.exe" -ArgumentList "install $paket -y --ignore-checksums" -Wait
            if ($paket.contains("--version")) {
                Write-Host "$Env:ProgramData\chocolatey\choco.exe pin add -n $($paket.split(' ')[0])"
                Start-Process -FilePath "$Env:ProgramData\chocolatey\choco.exe" -ArgumentList "pin add -n $($paket.split(' ')[0])" -Wait
            }
        }
    }
}