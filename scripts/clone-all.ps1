param(
    [string] $Catalog = "..\repos.json"
)
$catalogPath = Join-Path -Path $PSScriptRoot -ChildPath $Catalog
if (-not (Test-Path $catalogPath)) { Write-Error "Catalog not found: $catalogPath"; exit 1 }
$json = Get-Content $catalogPath | ConvertFrom-Json
foreach ($r in $json.repos) {
    $dest = Join-Path -Path $PSScriptRoot -ChildPath "..\repos\$($r.name)"
    if (-not (Test-Path $dest)) {
        git clone $r.remote $dest
    } else {
        Write-Host "Already exists: $($r.name)"
    }
}
