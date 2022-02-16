# [thespad/py-kms](https://github.com/thespad/docker-py-kms)

[![GitHub Release](https://img.shields.io/github/release/thespad/docker-py-kms.svg?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/thespad/docker-py-kms/releases)
![Commits](https://img.shields.io/github/commits-since/thespad/docker-py-kms/latest?color=26689A&include_prereleases&logo=github&style=for-the-badge)
![Image Size](https://img.shields.io/docker/image-size/thespad/py-kms/latest?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Size)
[![Docker Pulls](https://img.shields.io/docker/pulls/thespad/py-kms.svg?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/thespad/py-kms)
[![GitHub Stars](https://img.shields.io/github/stars/thespad/docker-py-kms.svg?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/thespad/docker-py-kms)
[![Docker Stars](https://img.shields.io/docker/stars/thespad/py-kms.svg?color=26689A&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/thespad/py-kms)

[![ci](https://img.shields.io/github/workflow/status/thespad/docker-py-kms/Check%20for%20update%20and%20release.svg?labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github&label=Check%20For%20Upstream%20Updates)](https://github.com/thespad/docker-py-kms/actions/workflows/called-ci.yml)
[![ci](https://img.shields.io/github/workflow/status/thespad/docker-py-kms/Check%20for%20base%20image%20updates.svg?labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github&label=Check%20For%20Baseimage%20Updates)](https://github.com/thespad/docker-py-kms/actions/workflows/called-baseimage-update.yml)
[![ci](https://img.shields.io/github/workflow/status/thespad/docker-py-kms/Build%20Image%20On%20Release.svg?labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github&label=Build%20Image)](https://github.com/thespad/docker-py-kms/actions/workflows/called-bakebuild.yml)

[py-kms](https://github.com/Py-KMS-Organization/py-kms) is a port of node-kms created by cyrozap, which is a port of either the C#, C++, or .NET implementations of KMS Emulator. The original version was written by CODYQX4 and is derived from the reverse-engineered code of Microsoft's official KMS. This version of py-kms is itself a fork of the original implementation by SystemRage, which was abandoned early 2021.

These are my own builds of the Minimal image using the [LSIO base](https://github.com/linuxserver/docker-baseimage-alpine) and s6 because the upstream project keeps accepting PRs for the entrypoint scripts that change their behaviour in ways that break the container.

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`.

Simply pulling `ghcr.io/thespad/py-kms` should retrieve the correct image for your arch.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | latest |
| arm64 | ✅ | latest |
| armhf | ✅ | latest |

## Versions

* **09.12.21:** - New container build from LSIO Alpine 3.15 base.
* **01.09.21:** - Initial Release.
