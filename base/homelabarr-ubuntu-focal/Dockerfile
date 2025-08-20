# Use official Ubuntu 20.04 (Focal) as base
FROM ubuntu:20.04

ARG VERSION

# set version for s6 overlay
ARG OVERLAY_VERSION="v3.1.5.0"
ARG TARGETPLATFORM

# add s6 overlay - use ADD to download directly
ADD https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp/
ADD https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp/s6-overlay-amd64.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-aarch64.tar.xz /tmp/s6-overlay-arm64.tar.xz
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends xz-utils && \
  tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
  if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
    tar -C / -Jxpf /tmp/s6-overlay-arm64.tar.xz; \
  else \
    tar -C / -Jxpf /tmp/s6-overlay-amd64.tar.xz; \
  fi && \
  rm /tmp/s6-overlay-*.tar.xz
# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME="/root" \
    LANGUAGE="en_US.UTF-8" \
    LANG="en_US.UTF-8" \
   TERM="xterm"

RUN \
 echo "**** install apt-utils and locales ****" && \
 DEBIAN_FRONTEND=noninteractive apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
   apt-utils \
   locales \
   curl \
   gnupg \
   ca-certificates \
   tzdata && \
 echo "**** generate locale ****" && \
 locale-gen en_US.UTF-8 && \
 echo "**** create abc user and make our folders ****" && \
 useradd -u 911 -U -d /config -s /bin/false abc && \
 usermod -G users abc && \
 mkdir -p /app /config /defaults && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# add local files
COPY ./base/homelabarr-ubuntu-focal/root/ /

ENTRYPOINT ["/init"]
