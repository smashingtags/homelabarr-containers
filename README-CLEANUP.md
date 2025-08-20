# GHCR Package Cleanup Instructions

## Prerequisites

1. **Create a GitHub Personal Access Token (PAT)**
   - Go to https://github.com/settings/tokens/new
   - Give it a descriptive name like "GHCR Cleanup"
   - Select scopes:
     - `read:packages` - to list packages
     - `delete:packages` - to delete packages
     - `repo` (optional) - if packages are tied to private repos
   - Generate and copy the token

## Running the Cleanup

### Step 1: Dry Run (See what will be deleted)
```bash
# Set your token
export GITHUB_TOKEN=ghp_yourtoken

# Run dry run (default)
./cleanup-old-packages.sh

# Or explicitly
DRY_RUN=true ./cleanup-old-packages.sh
```

### Step 2: Actual Deletion (After reviewing dry run)
```bash
# Set your token if not already set
export GITHUB_TOKEN=ghp_yourtoken

# Run actual deletion
DRY_RUN=false ./cleanup-old-packages.sh
```

## What Gets Cleaned

The script will remove all versions of packages with the old `docker-*` naming:

### Base Images
- docker-alpine
- docker-alpine-3-base
- docker-config
- docker-ubuntu-focal
- docker-ubuntu-jammy

### Mod Packages
- docker-mod-bazarr
- docker-mod-healthcheck
- docker-mod-lidarr
- docker-mod-nzbget
- docker-mod-qbittorrent
- docker-mod-sabnzbd
- docker-mod-tautulli

### App Containers
- docker-auto-replyarr
- docker-backup
- docker-crunchy
- docker-crunchydl
- docker-dockupdate
- docker-gdsa
- docker-gui
- docker-local-persist
- docker-mount
- docker-newznab
- docker-restic
- docker-rollarr
- docker-spotweb
- docker-traktarr
- docker-uploader
- docker-vnstat

## Alternative: GitHub Actions Automation

You can also use GitHub Actions for automated cleanup. Create `.github/workflows/cleanup-old-packages.yml`:

```yaml
name: Cleanup Old GHCR Packages

on:
  workflow_dispatch:
  schedule:
    - cron: '0 0 * * 0' # Weekly on Sunday

jobs:
  cleanup:
    runs-on: ubuntu-latest
    permissions:
      packages: write
    steps:
      - uses: actions/checkout@v4
      
      - name: Delete old docker-* packages
        uses: snok/container-retention-policy@v2
        with:
          image-names: |
            docker-alpine
            docker-alpine-3-base
            docker-config
            docker-ubuntu-focal
            docker-ubuntu-jammy
            docker-mod-*
            docker-auto-replyarr
            docker-backup
            docker-crunchy
            docker-crunchydl
            docker-dockupdate
            docker-gdsa
            docker-gui
            docker-local-persist
            docker-mount
            docker-newznab
            docker-restic
            docker-rollarr
            docker-spotweb
            docker-traktarr
            docker-uploader
            docker-vnstat
          cut-off: 0s # Delete all versions immediately
          account-type: personal
          token: ${{ secrets.GITHUB_TOKEN }}
```

## Manual Deletion via Web UI

You can also delete packages manually:
1. Go to https://github.com/smashingtags?tab=packages
2. Click on a package with `docker-*` naming
3. Click "Package settings" 
4. Scroll to "Danger Zone"
5. Click "Delete this package"

## Important Notes

- **Multi-arch images**: Deleting a multi-arch manifest will also delete all platform-specific images
- **No undo**: Package deletion is permanent
- **Rate limits**: GitHub API has rate limits, the script handles this gracefully
- **Permissions**: You need admin access to the packages to delete them