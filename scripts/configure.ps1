Write-Host [INFO] (Get-Date).ToLongTimeString(): "Configuring git"  -Foreground "Green"

# Configure user profile to include git into the PATH
'$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"'' >> $profile
# Add git to PATH for current session to be able to configure it futher
$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"

# Adding PoshGit to PATH
'$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\cmd"' >> $profile
$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\cmd"

# Setting up some globals
git config --global core.autocrlf false
git config --global push.default simple
git config --global credential.helper store
git config --global alias.a add
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.d diff
git config --global alias.br branch
git config --global alias.mr merge
git config --global alias.l log
git config --global alias.p pull
git config --global alias.rb rebase
git config --global alias.sh show
git config --global merge.tool winmerge
git config --global mergetool.prompt true
git config --global mergetool.keepBackup false
git config --global mergetool.trustExitCode true
git config --global diff.tool winmerge
git config --global difftool.prompt false

# A few color tweaks for Powershell
git config --global color.status.changed "cyan normal bold"
git config --global color.status.untracked "magenta normal bold

# Setting up Git prompt colors for Powershell
'$global:GitPromptSettings.WorkingForegroundColor = [ConsoleColor]::Yellow' >> $profile
'$global:GitPromptSettings.UntrackedForegroundColor = [ConsoleColor]::Yellow' >> $profile

Write-Host [INFO] (Get-Date).ToLongTimeString(): "Configuring Psxc"  -Foreground "Green"
'Import-Module Pscx' >> $profile