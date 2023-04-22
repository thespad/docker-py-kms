# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.17

# set version label
ARG BUILD_DATE
ARG VERSION
ARG APP_VERSION
LABEL build_version="Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thespad"
LABEL org.opencontainers.image.source="https://github.com/thespad/docker-py-kms"
LABEL org.opencontainers.image.url="https://github.com/thespad/docker-py-kms"

RUN \
  apk add --no-cache --update --virtual=build-dependencies \
    build-base \
    git \
    python3-dev && \
  apk add --no-cache --update \
    python3 && \
  git clone https://github.com/Py-KMS-Organization/py-kms/ /tmp/py-kms && \
  mv /tmp/py-kms/py-kms /home/ && \
  mv /tmp/py-kms/docker/docker-py3-kms-minimal/requirements.txt /home/py-kms && \
  python3 -m ensurepip && \
  pip3 install -U --no-cache-dir \
    pip \
    setuptools \
    wheel && \
  pip3 install -U --no-cache-dir pytz && \
  pip3 install -U --no-cache-dir --find-links https://wheel-index.linuxserver.io/alpine-3.17 -r /home/py-kms/requirements.txt && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    /tmp/*

COPY root/ /

WORKDIR /home/py-kms

EXPOSE 1688/tcp

VOLUME /config
