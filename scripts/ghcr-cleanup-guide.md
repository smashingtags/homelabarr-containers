# GHCR Container Cleanup Guide

## Current Status
- ✅ Created v1.0.0 tag and pushed to GitHub
- ✅ Triggered container builds with new versioning
- ⏳ Builds are queued/running (check: https://github.com/smashingtags/homelabarr-containers/actions)

## After Builds Complete

### 1. Verify New Tags Exist
Check that containers now have version tags:
```bash
# Check a sample container for new tags
docker pull ghcr.io/smashingtags/homelabarr-plex:v1.0.0
docker pull ghcr.io/smashingtags/homelabarr-plex:v1.0
docker pull ghcr.io/smashingtags/homelabarr-plex:v1
docker pull ghcr.io/smashingtags/homelabarr-plex:latest
```

### 2. View All GHCR Packages
Visit: https://github.com/smashingtags?tab=packages

### 3. Tags to KEEP (Do Not Delete)
- `latest` - Current stable version
- `v1.0.0` - Specific version tag
- `v1.0` - Minor version tag  
- `v1` - Major version tag
- `buildcache` - Build cache for faster builds
- `dev` - Development channel (if exists)
- `nightly` - Nightly builds (if exists)

### 4. Tags to DELETE
- `v-XXXXXXX` - SHA-based tags (e.g., v-8b2a645)
- `main` - Old branch tags
- Untagged manifests older than 7 days
- Any duplicate/test builds

### 5. Manual Cleanup via Web UI

For each container package:
1. Click on the package name
2. Click "Package settings" (right side)
3. Go to "Manage versions" 
4. Select old versions to delete:
   - Check boxes next to SHA-based tags
   - Check untagged manifests
   - DO NOT select latest, v1.0.0, v1.0, v1, or buildcache
5. Click "Delete selected versions"

### 6. Cleanup via GitHub CLI

```bash
# List all your packages
gh api /user/packages?package_type=container --paginate

# For a specific container, list versions
gh api /user/packages/container/homelabarr-plex/versions --paginate

# Delete a specific version (need version ID from above)
gh api -X DELETE /user/packages/container/homelabarr-plex/versions/VERSION_ID
```

### 7. Batch Cleanup Script (Use with Caution)

```bash
#!/bin/bash
# WARNING: Review each deletion carefully!

CONTAINERS="homelabarr-plex homelabarr-sonarr homelabarr-radarr"

for CONTAINER in $CONTAINERS; do
    echo "Processing $CONTAINER..."
    
    # Get all versions
    gh api /user/packages/container/$CONTAINER/versions --paginate > versions.json
    
    # Parse and identify SHA-based tags for deletion
    # This is a manual process - review versions.json first!
done
```

## Old Packages to Remove

Based on your earlier review, these old docker-* packages can be deleted entirely:
- docker-alpine
- docker-alpine-ssh  
- docker-alpine-v3
- docker-auto-replyarr
- docker-backup
- docker-config
- docker-create
- docker-crunchy
- docker-crunchydl
- docker-gdsa
- docker-gui
- docker-legacy-base
- docker-local-persist
- docker-mod-healthcheck
- docker-mod-nzbget
- docker-mod-qbittorrent
- docker-mod-rclone
- docker-mod-sabnzbd
- docker-mod-storagecheck
- docker-mod-tautulli
- docker-mount
- docker-newznab
- docker-restic
- docker-rollarr
- docker-spotweb
- docker-traktarr
- docker-ubuntu-focal
- docker-ubuntu-jammy
- docker-ubuntu-noble
- docker-ui
- docker-ui-legacy
- docker-uploader
- docker-vnstat
- docker-whisparr-nightly
- docker-wiki
- ubuntu

## Verification After Cleanup

```bash
# Verify clean package list
gh api /user/packages?package_type=container | jq '.[].name' | grep homelabarr

# Test pulling new versioned containers
docker pull ghcr.io/smashingtags/homelabarr-plex:v1.0.0
docker pull ghcr.io/smashingtags/homelabarr-sonarr:v1.0.0
```

## Important Notes

1. **Wait for builds to complete** before cleanup (30-60 minutes)
2. **Never delete** `latest` or `buildcache` tags
3. **Keep all version tags** (v1, v1.0, v1.0.0)
4. **Document what you delete** in case you need to recover
5. **Old docker-* packages** can be completely removed

## Build Status Links
- [Current Build Status](https://github.com/smashingtags/homelabarr-containers/actions)
- [GHCR Packages](https://github.com/smashingtags?tab=packages)
- [Container Registry](https://github.com/orgs/smashingtags/packages)