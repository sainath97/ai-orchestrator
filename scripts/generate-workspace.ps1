param()
$workspace = Join-Path -Path $PSScriptRoot -ChildPath "..\generated-workspace.code-workspace"
$folders = @()
$folders += @{ path = "." }
if (Test-Path (Join-Path -Path $PSScriptRoot -ChildPath "..\repos")) {
    Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath "..\repos") -Directory | ForEach-Object {
        $folders += @{ path = "repos/" + $_.Name }
    }
}
$json = @{ folders = $folders; settings = @{} } | ConvertTo-Json -Depth 5
Set-Content -Path $workspace -Value $json -Encoding utf8
Write-Host "Generated workspace: $workspace"
