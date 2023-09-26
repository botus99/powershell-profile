#If the file does not exist, create it.
if (!(Test-Path -Path $PROFILE -PathType Leaf)) {
    try {
        # Detect Version of Powershell & Create Profile directories if they do not exist.
        if ($PSVersionTable.PSEdition -eq "Core" ) { 
            if (!(Test-Path -Path ($env:userprofile + "\Documents\Powershell"))) {
                New-Item -Path ($env:userprofile + "\Documents\Powershell") -ItemType "directory"
            }
        }
        elseif ($PSVersionTable.PSEdition -eq "Desktop") {
            if (!(Test-Path -Path ($env:userprofile + "\Documents\WindowsPowerShell"))) {
                New-Item -Path ($env:userprofile + "\Documents\WindowsPowerShell") -ItemType "directory"
            }
        }

        Invoke-RestMethod https://github.com/botus99/powershell-profile/raw/main/Microsoft.PowerShell_profile.ps1 -o $PROFILE
        Write-Host "The profile @ [$PROFILE] has been created."
    }
    catch {
        throw $_.Exception.Message
    }
}
# If the file already exists, show the message and do nothing.
 else {
		 Get-Item -Path $PROFILE | Move-Item -Destination oldprofile.ps1 -Force
		 Invoke-RestMethod https://github.com/botus99/powershell-profile/raw/main/Microsoft.PowerShell_profile.ps1 -OutFile $PROFILE
		 Write-Host "The profile @ [$PROFILE] has been created and old profile removed."
 }
& $profile

# Choco install
#
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Scoop install
#
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop install sudo

# OMP Install
#
sudo scoop install oh-my-posh

# Font Install
# Get all installed font families
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$fontFamilies = (New-Object System.Drawing.Text.InstalledFontCollection).Families

# Check if Mononoki Nerd Font is installed
if ($fontFamilies -notcontains "Mononoki Nerd Font") {
    
    # Download and install Mononoki Nerd Font
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile("https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Mononoki.zip", ".\Mononoki.zip")

    Expand-Archive -Path ".\Mononoki.zip" -DestinationPath ".\Mononoki" -Force
    $destination = (New-Object -ComObject Shell.Application).Namespace(0x14)
    Get-ChildItem -Path ".\Mononoki" -Recurse -Filter "*.ttf" | ForEach-Object {
        If (-not(Test-Path "C:\Windows\Fonts\$($_.Name)")) {        
            # Install font
            $destination.CopyHere($_.FullName, 0x10)
        }
    }

    # Clean up
    Remove-Item -Path ".\Mononoki" -Recurse -Force
    Remove-Item -Path ".\Mononoki.zip" -Force
}

# Powershell modules
#
Install-Module -Name PackageManagement -Repository PSGallery -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name 7Zip4Powershell -Repository PSGallery -Force
Install-Module -Name dockercompletion -Repository PSGallery -Force
Install-Module -Name NuGet -Repository PSGallery -Force
Install-Module -Name Pester -Repository PSGallery -Force
Install-Module -Name Pscx -Repository PSGallery -Force
Install-Module -Name PowerShellGet -Repository PSGallery -Force
Install-Module -Name PSEverything -Repository PSGallery -Force
Install-Module -Name PSFzf -Repository PSGallery -Force
Install-Module -Name PSFuzzySearch -Repository PSGallery -Force
Install-Module -Name PSReadLine -Repository PSGallery -Force
Install-Module -Name PSColors -Repository PSGallery -Force
Install-Module -Name PSWindowsUpdate -Repository PSGallery -Force
Install-Module -Name PSWriteColor -Repository PSGallery -Force
Install-Module -Name psInlineProgress -Repository PSGallery -Force
Install-Module -Name posh-docker -Repository PSGallery -Force
Install-Module -Name posh-git -Repository PSGallery -Force
Install-Module -Name posh-cargo -Repository PSGallery -Force
Install-Module -Name scoop-completion -Repository PSGallery -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name Update-AllPSModules -Repository PSGallery -Force
Install-Module -Name z -Repository PSGallery -Force