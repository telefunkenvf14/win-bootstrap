Write-Host [INFO] (Get-Date).ToLongTimeString(): "Running pre-install scripts"  -Foreground "Green"

iex ("$PSScriptRoot\pre-install.ps1")

Write-Host [INFO] (Get-Date).ToLongTimeString(): "Installing software" -Foreground "Green"

$packagesPath = split-path $PSScriptRoot -parent

Write-Host [INFO] (Get-Date).ToLongTimeString(): "Loading packages list from $packagesPath\packages.json" -Foreground "Green"
$json = Get-Content -Raw -Path "$packagesPath\packages.json"
$packages = $json | Out-String | ConvertFrom-Json

foreach ($app in $packages.list) {
  Write-Host "Installing: $app"
  #choco install $app
}

Write-Host [INFO] (Get-Date).ToLongTimeString(): "Running post-install scripts" -Foreground "Green"

iex "$PSScriptRoot\post-install.ps1"

Write-Host [INFO] (Get-Date).ToLongTimeString(): "Configuring software" -Foreground "Green"

iex "$PSScriptRoot\configure.ps1"

Write-Host [INFO] (Get-Date).ToLongTimeString(): "Installation completed" -Foreground "Green"