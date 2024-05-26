# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.20

# set version label
ARG BUILD_DATE
ARG VERSION
ARG APP_VERSION
LABEL build_version="Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thespad"
LABEL org.opencontainers.image.source="https://github.com/thespad/docker-py-kms"
LABEL org.opencontainers.image.url="https://github.com/thespad/docker-py-kms"
LABEL org.opencontainers.image.description="A port of node-kms created by cyrozap, which is a port of either the C#, C++, or .NET implementations of KMS Emulator."
LABEL org.opencontainers.image.authors="thespad"

ENV PYTHONIOENCODING=utf-8 \
  VIRTUAL_ENV=/pyenv \
  PATH="/pyenv/bin:$PATH"

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
  mkdir -p /pyenv && \
  python3 -m venv /pyenv && \
  pip install -U --no-cache-dir \
    pip \
    setuptools \
    wheel && \
  pip install -U --no-cache-dir pytz && \
  pip install -U --no-cache-dir --find-links https://wheel-index.linuxserver.io/alpine-3.20 -r /home/py-kms/requirements.txt && \
  printf "Version: ${VERSION}\nBuild-date: ${BUILD_DATE}" > /build_version && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    /tmp/*

COPY root/ /

WORKDIR /home/py-kms

EXPOSE 1688/tcp

VOLUME /config
