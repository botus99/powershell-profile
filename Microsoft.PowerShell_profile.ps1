### The default location for this file is...
### C:\Users\...insert_your_name_here...\Documents\Powershell\


#############################
#         Aliases			#
#############################

### SCRIPTS ###
set-alias home "~/Documents/Powershell/home.ps1"
set-alias sa "~/Documents/Powershell/updatemygoods.ps1"

### SHIMS ###
set-alias chdman "~/scoop/apps/mame/current/chdman.exe"
set-alias lolcat "~/scoop/apps/rainbow/current/rainbow.exe"
set-alias pwsh "~/scoop/apps/powershell-preview/current/pwsh.exe"
set-alias shutup10 "~/scoop/apps/shutup10/current/OOSU10.exe"
set-alias vscode "~/scoop/apps/vscodium/current/VSCodium.exe"
set-alias vscodium "~/scoop/apps/vscodium/current/VSCodium.exe"

### MISC ###
set-alias info show
set-alias show info
set-alias whereami pwd


#############################
#        other crap			#
#############################

Import-Module Pscx
Import-Module PowerShellGet
Import-Module PSEverything
Import-Module PSFzf
Import-Module PSFuzzySearch
Import-Module PSReadLine
Import-Module PSColors
Import-Module PSWindowsUpdate
Import-Module PSWriteColor
Import-Module psInlineProgress
# Import-Module posh-docker
# Import-Module posh-git
# Import-Module posh-cargo
Import-Module Terminal-Icons
Import-Module Update-AllPSModules
Import-Module z

set-psreadlineoption -predictionsource history
set-psreadlineoption -predictionviewstyle listview
set-psreadlineoption -editmode windows
set-psreadlineOption -colors @{ inlineprediction = "#8A0303"}

#############################
#         PROMPT			#
#############################

oh-my-posh --init --shell pwsh --config "~/scoop/apps/oh-my-posh/current/themes/me.json" | Invoke-Expression
Enable-PoshTooltips
Enable-PoshTransientPrompt
$env:POSH_GIT_ENABLED = $true
$env:POSH_DOCKER_ENABLED = $true

#############################
#	STUFF I ADDED LATER		#
#############################

Invoke-Expression (&sfsu hook)
winfetch
cpufetch
