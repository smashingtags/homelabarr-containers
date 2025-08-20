#!/bin/bash

# HomelabARR Container Cleanup Script
# Safely removes old docker-* base directories after migration to homelabarr-*
# 
# IMPORTANT: This script ensures all references have been updated before deletion

set -e

echo "HomelabARR Container Cleanup - Removing old docker-* base directories"
echo "======================================================================"
echo ""

# Check if we're in the right directory
if [ ! -d "base" ] || [ ! -f ".github/workflows/build-all-containers.yml" ]; then
    echo "ERROR: This script must be run from the homelabarr-containers root directory"
    exit 1
fi

# List of old docker-* directories to remove
OLD_DIRS=(
    "base/docker-alpine"
    "base/docker-alpine-v3"
    "base/docker-config"
    "base/docker-create"
    "base/docker-dockserver"
    "base/docker-ubuntu-focal"
    "base/docker-ubuntu-jammy"
    "base/docker-ubuntu-noble"
    "base/docker-ui"
)

# Corresponding homelabarr-* replacements
REPLACEMENTS=(
    "base/homelabarr-alpine"
    "base/homelabarr-alpine-v3"
    "base/homelabarr-config"
    "base/homelabarr-create"
    "base/homelabarr-legacy-base"
    "base/homelabarr-ubuntu-focal"
    "base/homelabarr-ubuntu-jammy"
    "base/homelabarr-ubuntu-noble"
    "base/homelabarr-ui"
)

echo "Step 1: Checking for remaining references to old directories..."
echo "-----------------------------------------------------------------"

FOUND_REFS=0
for dir in "${OLD_DIRS[@]}"; do
    dirname=$(basename "$dir")
    echo -n "Checking for references to $dirname... "
    
    # Search for references in all relevant files (excluding the directories being deleted and cleanup scripts)
    # Also exclude external GitHub URLs that happen to contain the same name and backup directories
    if grep -r "$dirname" --include="*.yml" --include="*.yaml" --include="Dockerfile" --include="*.sh" . 2>/dev/null | \
       grep -v "cleanup-old-docker-dirs.sh" | \
       grep -v "cleanup-old-packages.sh" | \
       grep -v "^\./base/docker-" | \
       grep -v "^\./backup-docker-dirs-" | \
       grep -v "github.com/alpinelinux/docker-alpine" | \
       grep -v ".templates/" > /dev/null; then
        echo "FOUND!"
        echo "  References still exist in:"
        grep -r "$dirname" --include="*.yml" --include="*.yaml" --include="Dockerfile" --include="*.sh" . 2>/dev/null | \
            grep -v "cleanup-old-docker-dirs.sh" | \
            grep -v "cleanup-old-packages.sh" | \
            grep -v "^\./base/docker-" | \
            grep -v "^\./backup-docker-dirs-" | \
            grep -v "github.com/alpinelinux/docker-alpine" | \
            grep -v ".templates/" | head -5
        FOUND_REFS=1
    else
        echo "OK (no references)"
    fi
done

if [ $FOUND_REFS -eq 1 ]; then
    echo ""
    echo "ERROR: Found references to old docker-* directories!"
    echo "Please update all references before running this cleanup script."
    exit 1
fi

echo ""
echo "Step 2: Verifying homelabarr-* replacements exist..."
echo "------------------------------------------------------"

MISSING_REPLACEMENT=0
for i in "${!REPLACEMENTS[@]}"; do
    if [ ! -d "${REPLACEMENTS[$i]}" ]; then
        echo "ERROR: Replacement directory ${REPLACEMENTS[$i]} does not exist!"
        MISSING_REPLACEMENT=1
    else
        echo "✓ ${REPLACEMENTS[$i]} exists"
    fi
done

if [ $MISSING_REPLACEMENT -eq 1 ]; then
    echo ""
    echo "ERROR: Some replacement directories are missing!"
    echo "Cannot proceed with cleanup."
    exit 1
fi

echo ""
echo "Step 3: Creating backup of old directories..."
echo "----------------------------------------------"

BACKUP_DIR="backup-docker-dirs-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo "Created backup directory: $BACKUP_DIR"

for dir in "${OLD_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "Backing up $dir..."
        cp -r "$dir" "$BACKUP_DIR/"
    fi
done

echo ""
echo "Step 4: Summary of directories to be removed..."
echo "------------------------------------------------"

TOTAL_SIZE=0
for dir in "${OLD_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        SIZE=$(du -sh "$dir" 2>/dev/null | cut -f1)
        echo "  $dir ($SIZE)"
        TOTAL_SIZE=$((TOTAL_SIZE + $(du -sb "$dir" 2>/dev/null | cut -f1)))
    fi
done

echo ""
echo "Total space to be freed: $(numfmt --to=iec-i --suffix=B $TOTAL_SIZE)"
echo ""

# Confirmation prompt
read -p "Do you want to proceed with removing these directories? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
    echo "Cleanup cancelled."
    exit 0
fi

echo ""
echo "Step 5: Removing old docker-* directories..."
echo "---------------------------------------------"

for dir in "${OLD_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "Removing $dir..."
        rm -rf "$dir"
        echo "  ✓ Removed"
    else
        echo "Skipping $dir (doesn't exist)"
    fi
done

echo ""
echo "======================================================================"
echo "Cleanup completed successfully!"
echo ""
echo "Backup created at: $BACKUP_DIR"
echo "You can safely delete the backup after verifying everything works."
echo ""
echo "Next steps:"
echo "1. Test build a few containers to ensure everything works"
echo "2. Push changes to git"
echo "3. Delete the backup directory if everything is OK"
echo "======================================================================"