## HomelabARR - Prowlarr Container
## Maintainer: smashingtags
FROM ghcr.io/smashingtags/homelabarr-alpine:latest
LABEL org.opencontainers.image.source="https://github.com/smashingtags/homelabarr-containers"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG VERSION="1.3.3.3154"
ARG BRANCH="nightly"

ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
  echo "**** install packages ****" && \
    apk add -U --update --no-cache jq curl openssl tar sqlite-libs libintl icu-libs && \
  echo "**** install 'homelabarr-prowlarr' ****" && \
    mkdir -p /app/prowlarr/bin && \
    if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
      ARCH="arm64"; \
    else \
      ARCH="x64"; \
    fi && \
    echo "Downloading Prowlarr ${VERSION} for ${ARCH}" && \
    curl -o /tmp/prowlarr.tar.gz -L "https://prowlarr.servarr.com/v1/update/${BRANCH}/updatefile?version=${VERSION}&os=linuxmusl&runtime=netcore&arch=${ARCH}" && \
    tar xzf /tmp/prowlarr.tar.gz -C /app/prowlarr/bin --strip-components=1 && \
    rm /tmp/prowlarr.tar.gz && \
  printf "UpdateMethod=docker\nBranch=${BRANCH}\nPackageVersion=${VERSION}\nPackageAuthor=[homelabarr.io](https://homelabarr.io)" > /app/prowlarr/package_info && \
  echo "**** cleanup ****" && \
    rm -rf /app/prowlarr/bin/prowlarr.Update

COPY --chown=abc ./apps/homelabarr-prowlarr/root/ /
EXPOSE 9696
VOLUME /config
##EOF