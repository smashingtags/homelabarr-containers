#!/bin/bash

# Get the latest version tag for a container
# Usage: ./get-container-version.sh <container-name>

CONTAINER=$1
REGISTRY="ghcr.io"
OWNER="smashingtags"

# Try to get the latest version tag from git
LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null)

if [ -z "$LATEST_TAG" ]; then
    # No tags exist yet, use v1.0.0 as initial version
    echo "v1.0.0"
else
    # Return the latest tag
    echo "$LATEST_TAG"
fi