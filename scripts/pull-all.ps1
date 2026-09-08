Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath "..\repos") -Directory | ForEach-Object {
    Write-Host "Pulling $($_.FullName)"
    git -C $_.FullName pull
}
