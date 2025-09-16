# HomelabARR Container Images

<p align="center">
    <a href="https://github.com/smashingtags/homelabarr-cli">
        <img src="https://img.shields.io/badge/HomelabARR-CLI-blue?logo=github" alt="HomelabARR CLI">
    </a><br />
    <a href="https://github.com/smashingtags/homelabarr-containers/releases/latest">
        <img src="https://img.shields.io/github/v/release/smashingtags/homelabarr-containers?include_prereleases&label=Latest%20Release&logo=github" alt="Latest Official Release on GitHub">
    </a></br >
    <a href="https://github.com/smashingtags/homelabarr-containers/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/smashingtags/homelabarr-containers?label=License&logo=mit" alt="MIT License">
    </a><br />
    <a href="https://github.com/smashingtags/homelabarr-containers/actions">
        <img src="https://img.shields.io/github/actions/workflow/status/smashingtags/homelabarr-containers/build-all-containers.yml?branch=master&label=Container%20Builds&logo=github-actions" alt="Build Status">
    </a>
</p>

---

## 📦 About

This repository contains all Docker container images used by the [HomelabARR CLI](https://github.com/smashingtags/homelabarr-cli) project. These containers are specifically optimized and configured for the HomelabARR ecosystem, providing a comprehensive media server and homelab infrastructure.

## 🚀 Container Categories

- **Base Images** - Ubuntu (Focal/Jammy), Alpine, and specialized base containers
- **Applications** - Media automation tools, backup solutions, and utilities
- **Docker Mods** - Modifications for existing containers (healthchecks, rclone, etc.)
- **Nightly Builds** - Bleeding-edge versions of select applications

## 📋 Available Containers

All containers are published to GitHub Container Registry:
```
ghcr.io/smashingtags/<container-name>:latest
```

### Key Containers Include:
- Media server applications (GUI, Wiki, etc.)
- Download clients and automation tools
- Backup and sync solutions (Restic, GDSA, etc.)
- Monitoring and health check modifications
- And many more...

## 🛠️ Usage

These containers are designed to work seamlessly with HomelabARR CLI. To use them:

1. Install [HomelabARR CLI](https://github.com/smashingtags/homelabarr-cli)
2. Deploy applications using the CLI's Docker Compose templates
3. Containers will be automatically pulled from `ghcr.io/smashingtags/`

## ⚠️ Important Notes

> **Note**: These containers are optimized specifically for HomelabARR CLI and may have custom configurations that differ from upstream images.

> **Warning**: While these images are public, they're tailored for the HomelabARR ecosystem. Using them in other environments may require adjustments.

## 🏗️ Build Process

- Containers are automatically built using GitHub Actions
- Multi-architecture support (linux/amd64, linux/arm64)
- Automated testing and quality checks
- Discord notifications for build status

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request with your improvements

## 📖 Documentation

For detailed documentation on using these containers with HomelabARR CLI, visit:
- [HomelabARR CLI Documentation](https://github.com/smashingtags/homelabarr-cli/wiki)
- [Container Configuration Guide](https://github.com/smashingtags/homelabarr-cli/wiki/containers)

## 🙏 Acknowledgments

This repository builds upon ideas and code from:
- [LinuxServer.io](https://linuxserver.io) - Base image concepts and S6 overlay
- Original DockServer project - Initial container structure

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Contributors

<table>
<tr>
    <td align="center" style="word-wrap: break-word; width: 75.0; height: 75.0">
        <a href="https://github.com/smashingtags">
            <img src="https://avatars.githubusercontent.com/u/45863998?v=4" width="50;" style="border-radius:50%;align-items:center;justify-content:center;overflow:hidden;padding-top:10px" alt="smashingtags"/>
            <br />
            <sub style="font-size:14px"><b>smashingtags</b></sub>
        </a>
    </td>
</tr>
</table>

---

*Part of the HomelabARR ecosystem - Simplifying self-hosted media automation*


