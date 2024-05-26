# [thespad/py-kms](https://github.com/thespad/docker-py-kms)

[![GitHub Release](https://img.shields.io/github/release/thespad/docker-py-kms.svg?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/thespad/docker-py-kms/releases)
![Commits](https://img.shields.io/github/commits-since/thespad/docker-py-kms/latest?color=26689A&include_prereleases&logo=github&style=for-the-badge)
![Image Size](https://img.shields.io/docker/image-size/thespad/py-kms/latest?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Size)
[![Docker Pulls](https://img.shields.io/docker/pulls/thespad/py-kms.svg?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/thespad/py-kms)
[![GitHub Stars](https://img.shields.io/github/stars/thespad/docker-py-kms.svg?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/thespad/docker-py-kms)
[![Docker Stars](https://img.shields.io/docker/stars/thespad/py-kms.svg?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/thespad/py-kms)

[![ci](https://img.shields.io/github/actions/workflow/status/thespad/docker-py-kms/call-check-and-release.yml?branch=main&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github&label=Check%20For%20Upstream%20Updates)](https://github.com/thespad/docker-py-kms/actions/workflows/call-check-and-release.yml)
[![ci](https://img.shields.io/github/actions/workflow/status/thespad/docker-py-kms/call-baseimage-update.yml?branch=main&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github&label=Check%20For%20Baseimage%20Updates)](https://github.com/thespad/docker-py-kms/actions/workflows/call-baseimage-update.yml)
[![ci](https://img.shields.io/github/actions/workflow/status/thespad/docker-py-kms/call-build-image.yml?labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github&label=Build%20Image)](https://github.com/thespad/docker-py-kms/actions/workflows/call-build-image.yml)

[py-kms](https://github.com/Py-KMS-Organization/py-kms) is a port of node-kms created by cyrozap, which is a port of either the C#, C++, or .NET implementations of KMS Emulator. The original version was written by CODYQX4 and is derived from the reverse-engineered code of Microsoft's official KMS. This version of py-kms is itself a fork of the original implementation by SystemRage, which was abandoned early 2021.

These are my own builds of the Minimal image using the [LSIO base](https://github.com/linuxserver/docker-baseimage-alpine) and s6 because the upstream project keeps accepting PRs for the entrypoint scripts that change their behaviour in ways that break the container.

## Supported Architectures

Our images support multiple architectures.

Simply pulling `ghcr.io/thespad/py-kms:latest` should retrieve the correct image for your arch.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | latest |
| arm64 | ✅ | latest |

## Application Setup

More info at [py-kms](https://github.com/Py-KMS-Organization/py-kms).

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose ([recommended](https://docs.linuxserver.io/general/docker-compose))

Compatible with docker-compose v2 schemas.

```yaml
---
version: "2.1"
services:
  py-kms:
    image: ghcr.io/thespad/py-kms:latest
    container_name: py-kms
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - IP= #optional
    volumes:
      - /path/to/appdata/config:/config
    ports:
      - 1688:1688
    restart: unless-stopped
```

### docker cli

```shell
docker run -d \
  --name=py-kms \
  -e PUID=1000 \
  -e PGID=1000 \
  -e IP= `#optional` \
  -e TZ=Europe/London \
  -p 1688:1688 \
  -v /path/to/appdata/config:/config \
  --restart unless-stopped \
  ghcr.io/thespad/py-kms:latest
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 1688` | KMS Port |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London |
| `-e IP=` | IP address to bind to. Use `0.0.0.0` for all IPv4 interfaces. Defaults to `"::"` for all IPv6 & IPv4 interfaces. |
| `-v /config` | Contains all relevant configuration files. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```shell
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```

## Support Info

* Shell access whilst the container is running: `docker exec -it py-kms /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f py-kms`

### Image Update Notifications - Diun (Docker Image Update Notifier)

* We recommend [Diun](https://crazymax.dev/diun/) for update notifications. Other tools that automatically update containers unattended are not recommended or supported.

## Versions

* **30.12.23:** - Rebase to Alpine 3.19.
* **29.10.23:** - Provide IPv4-only option for legacy hosts.
* **14.05.23:** - Rebase to Alpine 3.18. Drop support for armhf.
* **19.03.23:** - Add `pytz`.
* **09.12.22:** - Rebase to Alpine 3.17.
* **24.09.22:** - Rebase to Alpine 3.16, migrate to s6v3.
* **09.12.21:** - New container build from LSIO Alpine 3.15 base.
* **01.09.21:** - Initial Release.
