param(
    [Parameter(Mandatory=$true)] [string] $Path,
    [Parameter(Mandatory=$true)] [string] $Name
)

$reposRoot = Join-Path -Path $PSScriptRoot -ChildPath "..\repos"
New-Item -ItemType Directory -Path $reposRoot -Force | Out-Null
$destination = Join-Path -Path $reposRoot -ChildPath $Name
if (Test-Path $destination) {
    Write-Error "Destination already exists: $destination"
    exit 1
}
if (-not (Test-Path $Path -PathType Container)) {
    Write-Error "Child repository path does not exist: $Path"
    exit 1
}

New-Item -ItemType Junction -Path $destination -Target (Resolve-Path $Path) | Out-Null
Write-Host "Linked $Path -> $destination"