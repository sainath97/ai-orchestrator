# Parent scripts

Scripts manage child repository checkouts only. They do not edit application files.

PowerShell:

```powershell
.\scripts\link-one.ps1 -Path 'C:\path\to\child' -Name child
.\scripts\link-existing.ps1 -Path 'C:\path\to\child' -Name child
.\scripts\clone-all.ps1
.\scripts\pull-all.ps1
.\scripts\generate-workspace.ps1
```

POSIX shells:

```bash
./scripts/link-one.sh /path/to/child child
./scripts/clone-all.sh
./scripts/pull-all.sh
./scripts/generate-workspace.sh
```

The generator writes ignored `generated-workspace.code-workspace`; `parent.code-workspace` is the committed parent-only workspace.

Before cloning, fill `repos.json` with real remotes. Never put credentials in the catalog or command line.