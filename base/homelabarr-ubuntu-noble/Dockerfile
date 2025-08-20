FROM ubuntu:24.04

ARG BUILDDATE
ARG VERSION
ARG OVERLAY_VERSION="v3.1.5.0"
ARG TARGETPLATFORM

LABEL build_version="HomelabARR version:- ${VERSION} Build-date:- ${BUILDDATE}"
LABEL maintainer="smashingtags"
LABEL base_image="ubuntu:24.04 (Noble Numbat)"
LABEL org.opencontainers.image.description="HomelabARR Ubuntu Noble base image with s6-overlay"

# Install base packages and s6-overlay
RUN \
  echo "**** install base packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    nano \
    wget \
    tzdata \
    locales \
    gnupg \
    lsb-release \
    apt-transport-https \
    software-properties-common \
    python3 \
    python3-pip \
    python3-venv \
    git \
    jq \
    unzip && \
  echo "**** generate locale ****" && \
  locale-gen en_US.UTF-8 && \
  echo "**** install s6-overlay ****" && \
  if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
    ARCH="x86_64"; \
  elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
    ARCH="aarch64"; \
  else \
    ARCH="x86_64"; \
  fi && \
  curl -L -o /tmp/s6-overlay-noarch.tar.xz \
    https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-noarch.tar.xz && \
  curl -L -o /tmp/s6-overlay-${ARCH}.tar.xz \
    https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-${ARCH}.tar.xz && \
  tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
  tar -C / -Jxpf /tmp/s6-overlay-${ARCH}.tar.xz && \
  echo "**** create abc user and make folders ****" && \
  useradd -u 911 -U -d /config -s /bin/false abc && \
  usermod -G users abc && \
  mkdir -p \
    /app \
    /config \
    /defaults \
    /data && \
  echo "**** add HomelabARR branding ****" && \
  echo "HomelabARR Container - Ubuntu Noble Base" > /etc/homelabarr-release && \
  echo "**** cleanup ****" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# Add local files
COPY base/homelabarr-ubuntu-noble/root/ /

# Environment variables
ENV DEBIAN_FRONTEND="noninteractive" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en" \
    LC_ALL="en_US.UTF-8" \
    PUID=1000 \
    PGID=1000 \
    TZ="UTC" \
    UMASK=022 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_VERBOSITY=1 \
    S6_STAGE2_HOOK=/docker-mods \
    HOMELABARR_RELEASE="noble"

ENTRYPOINT ["/init"]