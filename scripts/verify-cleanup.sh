#!/bin/bash

# Verify GHCR Cleanup Script
# This script checks that old packages are gone and new ones exist

echo "==========================================="
echo "GHCR Cleanup Verification"
echo "==========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check for old docker-* packages (should NOT exist)
echo "Checking old docker-* packages (should be GONE):"
echo "-----------------------------------------"
OLD_PACKAGES=(
    "docker-alpine"
    "docker-backup"
    "docker-gdsa"
    "docker-gui"
    "docker-mount"
)

for pkg in "${OLD_PACKAGES[@]}"; do
    if docker pull ghcr.io/smashingtags/$pkg:latest >/dev/null 2>&1; then
        echo -e "${RED}✗ $pkg still exists (should be deleted)${NC}"
    else
        echo -e "${GREEN}✓ $pkg removed successfully${NC}"
    fi
done

echo ""
echo "Checking new homelabarr-* packages (should EXIST):"
echo "-----------------------------------------"
NEW_PACKAGES=(
    "homelabarr-backup"
    "homelabarr-gdsa"
    "homelabarr-gui"
    "homelabarr-mount"
    "homelabarr-hlupdater"
)

for pkg in "${NEW_PACKAGES[@]}"; do
    if docker pull ghcr.io/smashingtags/$pkg:latest >/dev/null 2>&1; then
        echo -e "${GREEN}✓ $pkg exists with latest tag${NC}"
    else
        echo -e "${RED}✗ $pkg not found (build may have failed)${NC}"
    fi
done

echo ""
echo "Checking renamed package is gone:"
echo "-----------------------------------------"
if docker pull ghcr.io/smashingtags/homelabarr-dockupdate:latest >/dev/null 2>&1; then
    echo -e "${RED}✗ homelabarr-dockupdate still exists (should be deleted)${NC}"
else
    echo -e "${GREEN}✓ homelabarr-dockupdate removed (replaced by homelabarr-hlupdater)${NC}"
fi

echo ""
echo "==========================================="
echo "Cleanup Summary:"
echo "==========================================="
echo "1. All docker-* packages should be GONE"
echo "2. All homelabarr-* packages should EXIST"
echo "3. homelabarr-dockupdate should be GONE"
echo ""
echo -e "${YELLOW}Note: Some containers may not exist if they haven't been built yet${NC}"
echo ""