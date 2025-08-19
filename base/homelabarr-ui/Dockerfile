# https://github.com/nsano-rururu/docker-compose-ui
# DOCKER-VERSION 19.03
# ORIGINAL_MAINTAINER Naoyuki Sano <nsano@ae.em-net.ne.jp>
# MODDED_FROM dockserver[bot]@dockserver.io

FROM python:3.10-alpine AS builder
RUN pip install virtualenv && \
    apk add -U --no-cache --virtual=build-dependencies cargo \
       git \
       gcc \
       libffi-dev \
       make \
       musl-dev \
       openssl \
       openssl-dev \
       rust

ADD ./base/homelabarr-ui/root/app/requirements.txt /tmp/requirements.txt
RUN virtualenv /env && \
    /env/bin/python -m pip install --no-warn-script-location --upgrade pip setuptools && \
    /env/bin/pip install --no-warn-script-location --no-cache-dir cryptography && \
    /env/bin/pip install --no-warn-script-location --no-cache-dir -r /tmp/requirements.txt && \
    rm -rf /tmp/requirements.txt && \
    apk del --purge build-dependencies && \
    rm -rf /var/cache/apk/* /tmp/* 

## FINAL IMAGE
FROM python:3.10-alpine
RUN apk add -U --no-cache git bash rsync && \
    rm -rf /var/cache/apk/* /tmp/* 
COPY --from=builder /env /env
COPY ./base/homelabarr-ui/root/app/ /app
ADD ./base/homelabarr-ui/root/entrypoint.sh /app/entrypoint.sh

EXPOSE 5000
CMD []
ENTRYPOINT [ "bash", "/app/entrypoint.sh" ]

