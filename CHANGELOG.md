# Changelog

## [2.0.2](https://github.com/smashingtags/homelabarr-containers/compare/v2.0.1...v2.0.2) (2025-09-19)


### Bug Fixes

* misc updates naming ([0663fec](https://github.com/smashingtags/homelabarr-containers/commit/0663fec9fce48cbea4d1d1952efc1ff2650d8424))
* resolve Docker build failures for multiple containers ([6512754](https://github.com/smashingtags/homelabarr-containers/commit/65127545fd7454ec50a561e3279d38119cb96a0c))

## [2.0.1](https://github.com/smashingtags/homelabarr-containers/compare/v2.0.0...v2.0.1) (2025-09-18)


### Bug Fixes

* added more missed package.txt files ([2e62b3f](https://github.com/smashingtags/homelabarr-containers/commit/2e62b3f3332317d6e982c5aa9722c224f8781226))
* Remove nightly builds and fix base container errors ([43649ab](https://github.com/smashingtags/homelabarr-containers/commit/43649ab4a3fa315754cce18336e68b022d827404))
* Remove Whisparr containers and integrate upstream.sh ([779ac99](https://github.com/smashingtags/homelabarr-containers/commit/779ac9906428f73f1e7f134a289c959025749871))
* removed additional whsparr nightly ([4c22b4d](https://github.com/smashingtags/homelabarr-containers/commit/4c22b4d33a84b3f74e27c20ecf3ea9223ab067f2))
* rename all template scripts and update container references ([99f84a3](https://github.com/smashingtags/homelabarr-containers/commit/99f84a384be8c30765f07b7a76ea0c43a2a01dbe))
* update template headers and branding references ([25e8431](https://github.com/smashingtags/homelabarr-containers/commit/25e84313c4aea4dc91ab1631ad5eb3510388bc60))

## [2.0.0](https://github.com/smashingtags/homelabarr-containers/compare/v1.1.0...v2.0.0) (2025-09-17)


### ⚠ BREAKING CHANGES

* First major release with semantic versioning. All containers will now be tagged with proper version numbers instead of just 'latest'.
* Container renamed from homelabarr-dockupdate to homelabarr-hlupdater

### Features

* Add 37 new containers to complete homelab ecosystem ([7417bc5](https://github.com/smashingtags/homelabarr-containers/commit/7417bc52e6f960504e40de6a1b39824333c492ea))
* Add Discord notifications for container builds ([5b69d5e](https://github.com/smashingtags/homelabarr-containers/commit/5b69d5e845d315a5ab95133c1d9a231860b41138))
* Add homelabarr-mount-enhanced container with multi-provider cloud storage ([f8e72f4](https://github.com/smashingtags/homelabarr-containers/commit/f8e72f44ea004b1d9aaf91e4ed45f6e4b121b232))
* Add per-container Discord notifications for all build jobs ([ef27a49](https://github.com/smashingtags/homelabarr-containers/commit/ef27a493bb38c308159dfd802cbf3c89e648881d))
* Add Ubuntu 24.04 Noble base images for container migration ([41c38dc](https://github.com/smashingtags/homelabarr-containers/commit/41c38dc9e7cf211805a39652e2efd66eb7fbf260))
* Implement semantic versioning for all containers (HL-150) ([e595215](https://github.com/smashingtags/homelabarr-containers/commit/e595215c45991a924f5f7c070b6737610022d905))
* Remove broken homelabarr-mount-enhanced container (HL-390) ([f78166e](https://github.com/smashingtags/homelabarr-containers/commit/f78166e9a10a3e69e25fe392dee918ddac4fcd9e))
* Rename homelabarr-dockupdate to homelabarr-hlupdater (HL-149) ([8b2a645](https://github.com/smashingtags/homelabarr-containers/commit/8b2a645906c6d1658406ea7945f2b10b5d129a73))
* Rename homelabarr-hlupdater back to homelabarr-dockupdate ([0b6eec1](https://github.com/smashingtags/homelabarr-containers/commit/0b6eec1bc477af22ae295f7c70cee73248bd20ff))
* Rename homelabarr-hlupdater back to homelabarr-dockupdate                                                                                                                                                                                                   │ ([8714f13](https://github.com/smashingtags/homelabarr-containers/commit/8714f139194de76d3c66a4bb06ca552341857f5f))
* Restructure workflow build order with proper dependencies ([59c0bf8](https://github.com/smashingtags/homelabarr-containers/commit/59c0bf8d0b02683d3bd0ec9aecd2176923be15bb))
* Update Discord notifications to use secret and match DockServer format ([25de195](https://github.com/smashingtags/homelabarr-containers/commit/25de1951e52bdeb11cacc9761d7341c15b746d34))


### Bug Fixes

* Add Docker Hub auth and build caching optimizations ([2e70d88](https://github.com/smashingtags/homelabarr-containers/commit/2e70d884bd90d44e1e9f5608c53c54a7b4071b58))
* Add fixed workflow excluding failing containers ([9b68799](https://github.com/smashingtags/homelabarr-containers/commit/9b68799c35d0655ab78b316dfc0ac13f5a88efda))
* Add missing patch and root directories for Ubuntu Jammy ([019c27b](https://github.com/smashingtags/homelabarr-containers/commit/019c27bbd2299ae0e3fc314bdff5677629721d46))
* Add missing root directories for container builds ([ecc646c](https://github.com/smashingtags/homelabarr-containers/commit/ecc646c746cdb4adf28321c6ff0c4c0bc5ecbdc7))
* Add multi-arch support to Ubuntu Focal and Jammy base images ([bdbee76](https://github.com/smashingtags/homelabarr-containers/commit/bdbee76d110be996330544b3a6ed487d35da357d))
* Add path filters to release workflow and update CODEOWNERS ([6c8f500](https://github.com/smashingtags/homelabarr-containers/commit/6c8f5006b9e38ecc82b50b5ba92f3b4b9c6a7464))
* Add path filters to release workflow and update CODEOWNERS ([0a8c412](https://github.com/smashingtags/homelabarr-containers/commit/0a8c412826c591a7b56f1b27234c9d348959fb4c))
* Add xz-utils package to Ubuntu Focal and Jammy base images ([0c49283](https://github.com/smashingtags/homelabarr-containers/commit/0c4928376df580e7b009340320a5cf4e59bdcf82))
* Add xz-utils to Ubuntu Noble base image ([7caf3eb](https://github.com/smashingtags/homelabarr-containers/commit/7caf3eb625a5dc7b8fc0f60001287dfeabb2c041))
* bringing in some sh scripts ([9ab1479](https://github.com/smashingtags/homelabarr-containers/commit/9ab147996c5adda42d2681ef8a0adf530b9c51ca))
* Correct typo in homelabarr-gui cleanup path ([9da9f8f](https://github.com/smashingtags/homelabarr-containers/commit/9da9f8f2ee1e3b7dec52c2f9cdd3dce6afc89e38))
* Fix container build failures - Ubuntu base s6-overlay and UI/GUI containers ([b70f7e7](https://github.com/smashingtags/homelabarr-containers/commit/b70f7e7347066ef55b0323ce84dd245858c390ee))
* Fix token issues in workflows, disable complex workflows temporarily ([80a0f86](https://github.com/smashingtags/homelabarr-containers/commit/80a0f86391a2fca22b029d4b092ae3a4b50a5b9b))
* Keep websocat for Guacamole tunneling in homelabarr-gui ([23f5838](https://github.com/smashingtags/homelabarr-containers/commit/23f5838d4bd9860b0c97e78703965a0e1904b501))
* Make Ubuntu base image builds more resilient ([defb2d4](https://github.com/smashingtags/homelabarr-containers/commit/defb2d4e84e9d06c6647e82b26a38063afbd9df5))
* normalize line endings and remove homelabarr-ui-legacy from build matrix ([fbb4142](https://github.com/smashingtags/homelabarr-containers/commit/fbb4142190cb38e8510b98d7c050d866dc9b9261))
* normalize line endings for WSL compatibility ([0513ec8](https://github.com/smashingtags/homelabarr-containers/commit/0513ec8ca0f70010725f5cd089fc5b1241ad9c09))
* Optimize Rollarr build to avoid unnecessary compilation ([45c39d7](https://github.com/smashingtags/homelabarr-containers/commit/45c39d78cb19fad207d16dbeb0d7e66496082012))
* Pin micro editor to stable version 2.0.11 ([3c6f7ac](https://github.com/smashingtags/homelabarr-containers/commit/3c6f7acbbe9bbf9447469e673ad2bf207be91736))
* Remove duplicate docker-* containers from workflow ([af97e45](https://github.com/smashingtags/homelabarr-containers/commit/af97e45142473462f89647576275f6e7263aabad))
* Remove GHA cache to prevent 1.5+ hour hangs ([8c8a0c4](https://github.com/smashingtags/homelabarr-containers/commit/8c8a0c4b7385dde9fcb75ff9016d00efcf964b64))
* Remove homelabarr-n8n-mcp from build matrix ([69034b6](https://github.com/smashingtags/homelabarr-containers/commit/69034b68ecd3d29716ab37d21393bc6dce17ab55))
* Remove homelabarr-ui-legacy from base containers build matrix ([bca3664](https://github.com/smashingtags/homelabarr-containers/commit/bca366491a4b59fdc63643649d5bd2d2b1729945))
* Remove incompatible sources.list causing package conflicts ([4c5a4ff](https://github.com/smashingtags/homelabarr-containers/commit/4c5a4ff16f0c11eb308d6d7d3e12aa07587f10dc))
* Remove invalid dockserver-ui/root from base build matrix ([f86d847](https://github.com/smashingtags/homelabarr-containers/commit/f86d84787253aaebc0099d962cbc8ea5268775e4))
* Remove libuuid from homelabarr-gui runtime ([4cbfc9c](https://github.com/smashingtags/homelabarr-containers/commit/4cbfc9cbf78c3610e9e30688be160a8cc53a6585))
* Remove unnecessary workflow files causing token errors ([5a12280](https://github.com/smashingtags/homelabarr-containers/commit/5a12280dfe7a1fd78612fd21b1ebc5102ef5b1be))
* Remove unnecessary workflows and fix token issue in schedule.yaml ([a317a4e](https://github.com/smashingtags/homelabarr-containers/commit/a317a4e919c911353a9aee467d62a8ada665adfc))
* Remove websocat from homelabarr-gui to resolve OpenSSL compatibility ([1aa2c7e](https://github.com/smashingtags/homelabarr-containers/commit/1aa2c7e525df61e358286c50d873c410f112497d))
* Rename all container images from docker- to homelabarr- prefix ([724e24c](https://github.com/smashingtags/homelabarr-containers/commit/724e24c6e86b1aca2406809d28298f98c9308dbe))
* Replace docker-compose with docker package in homelabarr-ui ([d16f5f6](https://github.com/smashingtags/homelabarr-containers/commit/d16f5f612a2ff0b1e2a24b9646bb2ffa6bb88896))
* Replace hardcoded v1.0.0 tags with SHA-based versioning ([24204f1](https://github.com/smashingtags/homelabarr-containers/commit/24204f1ab8caae9c4b61a52f2d57aae1e85ff8fe))
* Resolve all 4 container build failures ([c0c51cd](https://github.com/smashingtags/homelabarr-containers/commit/c0c51cd00a0a5fa1712bfaf946f63ab951453cf1))
* Resolve build failures by switching to Docker Hub and adding missing containers ([08b4985](https://github.com/smashingtags/homelabarr-containers/commit/08b4985971e40926e5136fbd0ff8f3fe1e3b79a4))
* Resolve build failures by switching to Docker Hub and adding missing containers ([531b546](https://github.com/smashingtags/homelabarr-containers/commit/531b546e330ec1f5cd46975c2c2d681e9368eedf))
* Resolve container build failures for crunchydl, gdsa, and gui ([dc19108](https://github.com/smashingtags/homelabarr-containers/commit/dc19108bb2d2905edba9f6fd7b0fd5545a446d54))
* Resolve Docker build failures and registry authentication issues ([ad875c7](https://github.com/smashingtags/homelabarr-containers/commit/ad875c777112e901912ff154900d91a175f0e04a))
* Resolve Docker build failures and registry authentication issues ([ad64a0a](https://github.com/smashingtags/homelabarr-containers/commit/ad64a0a1e018f9bcb736399e26e1108ba0400e99))
* Resolve Docker build failures and registry authentication issues ([5fe3da8](https://github.com/smashingtags/homelabarr-containers/commit/5fe3da8a7e21c011b660888be1a7947d97fd0edc))
* Resolve Docker build failures and registry authentication issues                                                                                                                                                                                                                                                 │ ([88d7eba](https://github.com/smashingtags/homelabarr-containers/commit/88d7ebae3bb0704a38e09b81010489e2eb637a20))
* Resolve remaining container build failures ([627d9fd](https://github.com/smashingtags/homelabarr-containers/commit/627d9fd0cfa4c79c4bc12e3a2f45d845d9ee5e87))
* Switch to GitHub-hosted runners to avoid poisoned cache ([52665ea](https://github.com/smashingtags/homelabarr-containers/commit/52665eacd35ef69259e1264a0d7c921b1ca1226e))
* Switch Ubuntu base images to official Ubuntu Docker images ([98fc532](https://github.com/smashingtags/homelabarr-containers/commit/98fc53256954b1da38618ae2af5d69ec6722c6b0))
* Temporarily disable all cache to clear poisoned cache ([df7ea57](https://github.com/smashingtags/homelabarr-containers/commit/df7ea5776d43f6847df576c02dc5aa1c3fb1f202))
* Temporarily disable cache for mod builds to force rebuild ([6f88cef](https://github.com/smashingtags/homelabarr-containers/commit/6f88ceff3d73cc65395c097141a5becc36a45c4f))
* Update app container COPY paths from docker-* to homelabarr-* ([e5ee7d7](https://github.com/smashingtags/homelabarr-containers/commit/e5ee7d7dd92c67c9af3a69c70658fd160b3d61c0))
* Update CI scripts to use HomelabARR container registry ([ba07faa](https://github.com/smashingtags/homelabarr-containers/commit/ba07faa34b24e42c767d0bf9ae36f7365ce3116f))
* Update CI scripts to use HomeLabARR container registry ([0a4aacb](https://github.com/smashingtags/homelabarr-containers/commit/0a4aacb025bc50a515bb2b323407faa7080334f9))
* Update COPY paths for Ubuntu Noble base images ([7365fdc](https://github.com/smashingtags/homelabarr-containers/commit/7365fdc603598d99e5715391e4706c052d1cedd4))
* Update COPY paths in Ubuntu Focal and Jammy Dockerfiles ([58ef036](https://github.com/smashingtags/homelabarr-containers/commit/58ef036cccfc23803018e11a24b2a4af17c7992e))
* Update homelabarr-gui base image references from docker-alpine to homelabarr-alpine ([466adea](https://github.com/smashingtags/homelabarr-containers/commit/466adea91df68fe15746b7f81dc3571902154624))
* Update homelabarr-ui requirements.txt to use stable package versions ([1bb6ba1](https://github.com/smashingtags/homelabarr-containers/commit/1bb6ba1fb86cefce2c0b84677f40853f0a3227fa))
* Update mod Dockerfiles to use homelabarr-mod paths instead of docker-mod ([427701b](https://github.com/smashingtags/homelabarr-containers/commit/427701bc0c95e13f15a62f4ff6d82ca4cf032341))
* Update version script and add automated version workflow ([2f24833](https://github.com/smashingtags/homelabarr-containers/commit/2f24833682206f4269716f1d30dfbdcad02cfe59))
* Use python:3.10-slim base for homelabarr-rollarr ([ba9a780](https://github.com/smashingtags/homelabarr-containers/commit/ba9a780c9c135531ef78c730ccc241933ee24a6b))


### Reverts

* Re-enable cache for mod builds ([9d7a586](https://github.com/smashingtags/homelabarr-containers/commit/9d7a586e4bd93b4e1633718fe2bb7065ef62052e))

## [1.1.0](https://github.com/smashingtags/homelabarr-containers/compare/v1.0.0...v1.1.0) (2025-09-16)


### Features

* Add 37 new containers to complete homelab ecosystem ([7417bc5](https://github.com/smashingtags/homelabarr-containers/commit/7417bc52e6f960504e40de6a1b39824333c492ea))
* Add homelabarr-mount-enhanced container with multi-provider cloud storage ([f8e72f4](https://github.com/smashingtags/homelabarr-containers/commit/f8e72f44ea004b1d9aaf91e4ed45f6e4b121b232))
* Remove broken homelabarr-mount-enhanced container (HL-390) ([f78166e](https://github.com/smashingtags/homelabarr-containers/commit/f78166e9a10a3e69e25fe392dee918ddac4fcd9e))
* Rename homelabarr-hlupdater back to homelabarr-dockupdate ([0b6eec1](https://github.com/smashingtags/homelabarr-containers/commit/0b6eec1bc477af22ae295f7c70cee73248bd20ff))
* Rename homelabarr-hlupdater back to homelabarr-dockupdate                                                                                                                                                                                                   │ ([8714f13](https://github.com/smashingtags/homelabarr-containers/commit/8714f139194de76d3c66a4bb06ca552341857f5f))


### Bug Fixes

* Add path filters to release workflow and update CODEOWNERS ([6c8f500](https://github.com/smashingtags/homelabarr-containers/commit/6c8f5006b9e38ecc82b50b5ba92f3b4b9c6a7464))
* Add path filters to release workflow and update CODEOWNERS ([0a8c412](https://github.com/smashingtags/homelabarr-containers/commit/0a8c412826c591a7b56f1b27234c9d348959fb4c))
* normalize line endings and remove homelabarr-ui-legacy from build matrix ([fbb4142](https://github.com/smashingtags/homelabarr-containers/commit/fbb4142190cb38e8510b98d7c050d866dc9b9261))
* normalize line endings for WSL compatibility ([0513ec8](https://github.com/smashingtags/homelabarr-containers/commit/0513ec8ca0f70010725f5cd089fc5b1241ad9c09))
* Remove GHA cache to prevent 1.5+ hour hangs ([8c8a0c4](https://github.com/smashingtags/homelabarr-containers/commit/8c8a0c4b7385dde9fcb75ff9016d00efcf964b64))
* Remove homelabarr-n8n-mcp from build matrix ([69034b6](https://github.com/smashingtags/homelabarr-containers/commit/69034b68ecd3d29716ab37d21393bc6dce17ab55))
* Remove homelabarr-ui-legacy from base containers build matrix ([bca3664](https://github.com/smashingtags/homelabarr-containers/commit/bca366491a4b59fdc63643649d5bd2d2b1729945))
* Rename all container images from docker- to homelabarr- prefix ([724e24c](https://github.com/smashingtags/homelabarr-containers/commit/724e24c6e86b1aca2406809d28298f98c9308dbe))
* Switch to GitHub-hosted runners to avoid poisoned cache ([52665ea](https://github.com/smashingtags/homelabarr-containers/commit/52665eacd35ef69259e1264a0d7c921b1ca1226e))
* Temporarily disable all cache to clear poisoned cache ([df7ea57](https://github.com/smashingtags/homelabarr-containers/commit/df7ea5776d43f6847df576c02dc5aa1c3fb1f202))
* Update CI scripts to use HomelabARR container registry ([ba07faa](https://github.com/smashingtags/homelabarr-containers/commit/ba07faa34b24e42c767d0bf9ae36f7365ce3116f))
* Update CI scripts to use HomeLabARR container registry ([0a4aacb](https://github.com/smashingtags/homelabarr-containers/commit/0a4aacb025bc50a515bb2b323407faa7080334f9))
