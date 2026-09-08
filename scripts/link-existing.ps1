param(
    [Parameter(Mandatory=$true)] [string] $Path,
    [Parameter(Mandatory=$true)] [string] $Name
)

# Create repos directory
$destRoot = Join-Path -Path $PSScriptRoot -ChildPath "..\repos"
if (-not (Test-Path $destRoot)) { New-Item -ItemType Directory -Path $destRoot -Force | Out-Null }

$dest = Join-Path -Path $destRoot -ChildPath $Name
if (Test-Path $dest) {
    Write-Error "Destination already exists: $dest"
    exit 1
}

Write-Host "Creating junction from $Path to $dest"
if (-not (Test-Path $Path)) {
    Write-Error "Source path does not exist: $Path"
    exit 1
}

# Use junction (Windows)
cmd /c mklink /J "$dest" "$(Resolve-Path $Path)"
Write-Host "Linked. Run .\scripts\generate-workspace.ps1 to update generated-workspace.code-workspace."
