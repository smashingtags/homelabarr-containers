#!/usr/bin/with-contenv bash
# shellcheck shell=bash
####################################
# Docker owned by homelabarr       #
# Docker Maintainer smashingtags   #
####################################

mkdir -p /opt/lxc
cat > /opt/lxc/.lxcstart.sh << EOF; $(echo)
#!/bin/bash
#
# Title:      LXC Bypass the mount :shared
# OS Branch:  ubuntu,debian,rasbian
# Author(s):  mrdoob
# Coauthor:   DrAgOn141
# GNU:        General Public License v3.0
################################################################################
## make / possible to add /mnt:shared
mount --make-shared /
EOF
