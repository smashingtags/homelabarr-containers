# homelabarr-hlupdater

A Discord notification bot that monitors your running Docker containers for available updates and sends notifications when newer versions are available on Docker Hub.

## What it does

- Scans all running containers every 10 minutes
- Checks Docker Hub API for image updates in the last 24 hours
- Sends Discord notifications via webhook when updates are available
- Runs continuously as a monitoring service

## Usage

```bash
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  ghcr.io/smashingtags/homelabarr-hlupdater:latest \
  YOUR_DISCORD_WEBHOOK_ID
```

## Setup

1. **Create Discord Webhook**:
   - Go to Discord server settings → Integrations → Webhooks
   - Create webhook for your desired channel
   - Copy webhook URL: `https://discord.com/api/webhooks/WEBHOOK_ID/TOKEN`
   - Extract the WEBHOOK_ID portion

2. **Run Container**:
   ```bash
   docker run --rm \
     -v /var/run/docker.sock:/var/run/docker.sock:ro \
     ghcr.io/smashingtags/homelabarr-hlupdater:latest \
     1234567890123456789
   ```

## Discord Notification Format

Sends rich embeds with:
- Title: "HomelabARR Container Update Bot"
- Username: "HomelabARR-Update-Bot"
- List of containers with available updates
- Blue color theme (#2D2F95)

## Requirements

- Read access to Docker socket (`/var/run/docker.sock`)
- Valid Discord webhook ID
- Internet access to query Docker Hub API

## Technical Details

- Checks updates every 10 minutes
- Only reports images updated in last 24 hours
- Handles both official and third-party Docker Hub images
- Automatically formats image names (adds `library/` prefix for official images)