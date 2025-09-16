# SAFE GHCR Cleanup - HomelabARR ONLY

## ⚠️ IMPORTANT: Only Delete These Specific Packages

### ✅ SAFE TO DELETE - Old HomelabARR Packages (docker-* prefix)
These are the OLD HomelabARR packages that were renamed to homelabarr-*:

```
docker-alpine
docker-alpine-ssh
docker-alpine-v3
docker-auto-replyarr
docker-backup
docker-config
docker-create
docker-crunchy
docker-crunchydl
docker-gdsa
docker-gui
docker-legacy-base
docker-local-persist
docker-mod-healthcheck
docker-mod-nzbget
docker-mod-qbittorrent
docker-mod-rclone
docker-mod-sabnzbd
docker-mod-storagecheck
docker-mod-tautulli
docker-mount
docker-newznab
docker-restic
docker-rollarr
docker-spotweb
docker-traktarr
docker-ubuntu-focal
docker-ubuntu-jammy
docker-ubuntu-noble
docker-ui
docker-ui-legacy
docker-uploader
docker-vnstat
docker-whisparr-nightly
docker-wiki
```

### ✅ ALSO SAFE TO DELETE - Renamed Package
```
homelabarr-dockupdate   (renamed to homelabarr-hlupdater)
```

### ⚠️ For Current homelabarr-* Packages - SELECTIVE Cleanup

For packages starting with `homelabarr-`, only delete these TAGS:
- Tags starting with `v-` followed by 7 characters (SHA tags like `v-8b2a645`)
- Untagged manifests older than 7 days
- Any `main` branch tags (old format)

### 🛑 DO NOT DELETE These Tags on homelabarr-* packages:
- `latest`
- `v1.0.0`
- `v1.0`
- `v1`
- `buildcache`
- `dev` (if exists)
- `nightly` (if exists)

### 🚫 DO NOT TOUCH - Non-HomelabARR Packages
Leave ALL other packages that don't match the patterns above completely alone, including:
- Any personal projects
- Any other tools/utilities
- Anything not in the lists above

## Safe Cleanup Commands

### Option 1: Web UI (Safest)
1. Go to https://github.com/smashingtags?tab=packages
2. ONLY click on packages listed above
3. Delete entire package for `docker-*` ones
4. For `homelabarr-*` packages, only delete old SHA tags

### Option 2: CLI (Be Very Careful)
```bash
# List packages to verify what you have
gh api /user/packages?package_type=container --paginate | jq '.[].name' | sort

# For each OLD docker-* package listed above:
PACKAGE="docker-alpine"  # Replace with package from list
gh api /user/packages/container/$PACKAGE/versions --paginate
# Then delete the entire package if it's in the safe list

# For homelabarr-* packages, be selective about tags
PACKAGE="homelabarr-plex"
gh api /user/packages/container/$PACKAGE/versions --paginate | jq '.[] | select(.metadata.container.tags[] | startswith("v-")) | .id'
# Only delete SHA-based tags, not version tags
```

## Summary Checklist

- [ ] Wait for builds to complete
- [ ] Delete ALL `docker-*` packages from the list above (35 total)
- [ ] Delete `homelabarr-dockupdate` package
- [ ] For `homelabarr-*` packages: ONLY delete SHA tags (v-xxxxxxx)
- [ ] Keep all version tags (latest, v1.0.0, v1.0, v1)
- [ ] Don't touch ANY other packages not listed here

## Verification
After cleanup, you should have:
- ✅ All `homelabarr-*` packages with clean version tags
- ✅ No old `docker-*` HomelabARR packages
- ✅ All your other non-HomelabARR packages untouched