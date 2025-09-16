# GHCR Cleanup Verification

## ✅ Build Status
- **Semantic versioning commit**: Successfully built
- **Containers**: Available with `latest` tag
- **Version tags**: Will be created by release workflow

## 🗑️ Ready to Delete

### Old docker-* packages (35 total):
These are the old HomelabARR containers before renaming:
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
- ubuntu (if it's the old HomelabARR one)

### Also delete:
- homelabarr-hlupdater (renamed back to homelabarr-dockupdate)

### For homelabarr-* packages, only delete:
- SHA-based tags (v-xxxxxxx format)
- Untagged manifests
- Old "main" branch tags

## 🚫 DO NOT DELETE:
- container-port-manager (separate project)
- n8n-mcp (separate project)
- Any other non-HomelabARR packages
- Tags: latest, buildcache, v1.0.0, v1.0, v1

## 📋 Cleanup Process

1. Go to: https://github.com/smashingtags?tab=packages
2. Click on each docker-* package listed above
3. Delete the entire package
4. For homelabarr-* packages, only delete old SHA tags
5. Keep all version tags and latest

## 🎯 End Result
- No more docker-* packages
- Clean homelabarr-* packages with proper tags
- All other packages untouched