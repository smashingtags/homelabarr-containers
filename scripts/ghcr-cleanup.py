#!/usr/bin/env python3
"""
GHCR Cleanup Script for HomelabARR Containers
Identifies and lists old unversioned container images for cleanup
"""

import json
import subprocess
import sys
from datetime import datetime, timedelta
from typing import List, Dict, Set

# Configuration
GHCR_NAMESPACE = "ghcr.io/smashingtags"
KEEP_TAGS = {"latest", "buildcache", "dev", "nightly", "edge"}  # Always keep these
KEEP_DAYS = 7  # Keep untagged images from last N days

def get_all_containers() -> Set[str]:
    """Get list of all HomelabARR containers from local directories"""
    containers = set()
    
    # Find all homelabarr-* directories
    import os
    for base_dir in ['apps', 'base', 'mod', 'nightly']:
        if os.path.exists(base_dir):
            for item in os.listdir(base_dir):
                if item.startswith('homelabarr-'):
                    containers.add(item)
    
    # Add any renamed containers
    containers.discard('homelabarr-dockupdate')  # Old name, removed
    
    return containers

def get_ghcr_tags(container: str) -> List[Dict]:
    """Get all tags for a container from GHCR"""
    print(f"Checking {container}...")
    
    # This would normally use GitHub API, but for now we'll list known patterns
    # In production, you'd use: gh api /user/packages/container/{container}/versions
    
    tags_to_check = []
    
    # Common tag patterns to look for
    common_tags = [
        "latest",
        "v1.0.0",  # New version tag
        "v1.0",    # Minor version tag
        "v1",      # Major version tag
        "dev",
        "nightly",
        "buildcache"
    ]
    
    # Add SHA-based tags (v-xxxxxxx format)
    # These are the ones we want to clean up
    
    return common_tags

def identify_cleanup_candidates(containers: Set[str]) -> Dict[str, List[str]]:
    """Identify which container tags can be cleaned up"""
    cleanup = {}
    
    for container in sorted(containers):
        cleanup[container] = {
            'keep': [],
            'remove': [],
            'unknown': []
        }
        
        # Tags to keep
        cleanup[container]['keep'] = [
            'latest',
            'v1.0.0',
            'v1.0', 
            'v1',
            'buildcache'
        ]
        
        # Old tags to remove (SHA-based, old unversioned)
        # These would be identified via API in production
        cleanup[container]['remove'] = [
            # SHA-based tags like 'v-8b2a645'
            # Old 'main' branch tags
            # Any tags older than KEEP_DAYS
        ]
    
    return cleanup

def generate_cleanup_commands(cleanup: Dict) -> List[str]:
    """Generate gh CLI commands to delete old packages"""
    commands = []
    
    for container, tags in cleanup.items():
        if tags.get('remove'):
            for tag in tags['remove']:
                # gh api command to delete specific package version
                cmd = f"# gh api -X DELETE /user/packages/container/{container}/versions/VERSION_ID"
                commands.append(cmd)
    
    return commands

def main():
    print("=" * 60)
    print("GHCR Cleanup Analysis for HomelabARR Containers")
    print("=" * 60)
    print()
    
    # Get all containers
    containers = get_all_containers()
    print(f"Found {len(containers)} HomelabARR containers")
    print()
    
    # Identify cleanup candidates
    print("Analyzing cleanup candidates...")
    cleanup = identify_cleanup_candidates(containers)
    
    # Summary
    print("\n" + "=" * 60)
    print("CLEANUP SUMMARY")
    print("=" * 60)
    
    total_keep = 0
    total_remove = 0
    
    for container in sorted(cleanup.keys()):
        tags = cleanup[container]
        keep_count = len(tags['keep'])
        remove_count = len(tags['remove'])
        
        total_keep += keep_count
        total_remove += remove_count
        
        if remove_count > 0:
            print(f"\n{container}:")
            print(f"  Keep: {keep_count} tags ({', '.join(tags['keep'][:3])}...)")
            if tags['remove']:
                print(f"  Remove: {remove_count} tags")
    
    print("\n" + "-" * 60)
    print(f"TOTAL: Keep {total_keep} tags, Remove {total_remove} tags")
    print("-" * 60)
    
    # Generate cleanup commands
    if total_remove > 0:
        print("\n" + "=" * 60)
        print("CLEANUP COMMANDS")
        print("=" * 60)
        print("\nTo view packages that can be deleted:")
        print("gh api /user/packages?package_type=container")
        print("\nTo delete specific versions (requires version IDs from API):")
        print("# Get version IDs first:")
        print("gh api /user/packages/container/CONTAINER_NAME/versions")
        print("\n# Then delete specific versions:")
        print("gh api -X DELETE /user/packages/container/CONTAINER_NAME/versions/VERSION_ID")
        
    print("\n" + "=" * 60)
    print("NEXT STEPS")
    print("=" * 60)
    print("1. Wait for current build to complete (~30-60 minutes)")
    print("2. Verify new v1.0.0 tags are present on all containers")
    print("3. Use GitHub web UI to delete old unversioned packages:")
    print("   https://github.com/smashingtags?tab=packages")
    print("4. Or use gh CLI with the commands above")
    print("\nNOTE: Keep 'latest' and 'buildcache' tags!")
    print("Only delete SHA-based tags (v-xxxxxxx) and old untagged versions")

if __name__ == "__main__":
    main()