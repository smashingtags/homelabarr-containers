#!/bin/bash

# Fix all app container Dockerfile paths from docker-* to homelabarr-*

echo "Fixing app container Dockerfile paths..."

# List of containers to fix
containers=(
    "homelabarr-auto-replyarr"
    "homelabarr-backup"
    "homelabarr-crunchy"
    "homelabarr-dockupdate"
    "homelabarr-gdsa"
    "homelabarr-mount"
    "homelabarr-newznab"
    "homelabarr-restic"
    "homelabarr-spotweb"
    "homelabarr-traktarr"
    "homelabarr-uploader"
    "homelabarr-vnstat"
)

for container in "${containers[@]}"; do
    dockerfile="apps/$container/Dockerfile"
    if [ -f "$dockerfile" ]; then
        echo "Processing $container..."
        # Replace docker-* with homelabarr-* in COPY paths
        sed -i "s|/apps/docker-${container#homelabarr-}/|/apps/$container/|g" "$dockerfile"
        echo "  Fixed $dockerfile"
    fi
done

echo "Done! All app container paths have been updated."