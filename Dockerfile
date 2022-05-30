FROM ghcr.io/linuxserver/baseimage-alpine:3.15

# set version label
ARG BUILD_DATE
ARG VERSION
ARG APP_VERSION
LABEL build_version="Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thespad"
LABEL org.opencontainers.image.source="https://github.com/TheSpad/docker-py-kms"

RUN \
  apk add --update --no-cache --virtual=build-dependencies \
    git \
    gcc \
    musl-dev \
    py3-wheel \
    python3-dev && \
  apk add --no-cache --update \
    bash \
    ca-certificates \
    python3 \
    python3-tkinter \
    py3-pip \
    tzdata && \
  git clone https://github.com/Py-KMS-Organization/py-kms/ /tmp/py-kms && \
  mv /tmp/py-kms/py-kms /home/ && \
  mv /tmp/py-kms/docker/requirements_minimal.txt /home/py-kms && \
  pip3 install --no-cache-dir -U pip && \
  pip3 install --no-cache-dir -U -r /home/py-kms/requirements_minimal.txt && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    /tmp/*

COPY root/ /

WORKDIR /home/py-kms

EXPOSE 1688/tcp

VOLUME /config
