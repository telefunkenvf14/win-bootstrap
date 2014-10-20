Write-Host [INFO] (Get-Date).ToLongTimeString(): "Configuring user profile"  -Foreground "Green"

If ((Test-Path $profile) -eq $True) {
  Write-Host [INFO] (Get-Date).ToLongTimeString(): "Profile exists" -Foreground "Green"
}
Else {
  Write-Host [WARN] (Get-Date).ToLongTimeString(): "Profile doesn't exist" -Foreground "Yellow"
  Write-Host [INFO] (Get-Date).ToLongTimeString(): "Creating user profile" -Foreground "Green"

  New-Item -Path $profile -ItemType File -force
  If ((Test-Path $profile) -eq $True) {
    Write-Host [INFO] (Get-Date).ToLongTimeString(): "Profile was successfuly created" -Foreground "Green"
  }
  Else {
    Write-Host [ERROR] (Get-Date).ToLongTimeString(): "Can not create profile" -Foreground "Red"
    Write-Host [ERROR] (Get-Date).ToLongTimeString(): "Terminating" -Foreground "Red"
    Exit
  }
}