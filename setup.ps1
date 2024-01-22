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

# install Choco
#
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# install Scoop
#
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# install Scoop buckets
#
scoop bucket add ACooper81_scoop-apps
# scoop bucket add alkuzad_unxutils-separated
scoop bucket add athrunsun
scoop bucket add batkiz_backit
scoop bucket add brave-simpletons_scoop-the-business
scoop bucket add cc713_ownscoop
scoop bucket add dango
scoop bucket add DoveBoy_Apps
scoop bucket add echo
scoop bucket add emulators
scoop bucket add extras
scoop bucket add foosel
scoop bucket add galaxy-integrations
scoop bucket add games
# scoop bucket add gregwen_grewen-scoop
scoop bucket add hoilc_scoop-lemon
# scoop bucket add hu3rror_scoop-muggle
# scoop bucket add huangnauh_carrot
# scoop bucket add HUMORCE_nuke
scoop bucket add java
# scoop bucket add jetbrains
scoop bucket add kkzzhizhou_scoop-zapps
# scoop bucket add KnotUntied_scoop-fonts
scoop bucket add KnotUntied_scoop-knotuntied
scoop bucket add lemon
scoop bucket add main
scoop bucket add naderi
scoop bucket add nerd-fonts
scoop bucket add nirsoft
scoop bucket add nirsoft-alternative
scoop bucket add nonportable
scoop bucket add p8rdev_scoop-portableapps
# scoop bucket add php
# scoop bucket add php-bucket
# scoop bucket add pleiades
scoop bucket add python
# scoop bucket add raresoft
# scoop bucket add rasa
scoop bucket add retools
# scoop bucket add rivy_scoop-bucket
# scoop bucket add scoop-aoks
# scoop bucket add scoop-dev-apps
scoop bucket add scoopet
scoop bucket add snyk
# scoop bucket add spotify
# scoop bucket add sushi
# scoop bucket add sysinternals
# scoop bucket add TheRandomLabs
scoop bucket add versions
scoop bucket add wangzq
scoop bucket add wholegale39_onetab
scoop bucket add wsl
scoop bucket add x-magic_scoop-bucket
scoop bucket add yuanying1199
scoop update

# install Oh My Posh
#
scoop install oh-my-posh

# install Nerd Font 
scoop install nerd-fonts/Mononoki-NF
scoop install nerd-fonts/Mononoki-NF-Mono
scoop install nerd-fonts/Mononoki-NF-Propo

# install scoop-completion & dockercompletion
scoop install scoop-completion
scoop install dockercompletion

# Powershell modules
#
Install-Module -Name PackageManagement -Repository PSGallery -Force
Install-Module -Name 7Zip4Powershell -Repository PSGallery -Force
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
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name Update-AllPSModules -Repository PSGallery -Force
Install-Module -Name z -Repository PSGallery -Force
