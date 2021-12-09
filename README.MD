# [thespad/py-kms](https://github.com/thespad/docker-py-kms)

[![GitHub Stars](https://img.shields.io/github/stars/thespad/docker-py-kms.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/thespad/docker-py-kms)
[![GitHub Release](https://img.shields.io/github/release/thespad/docker-py-kms.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/thespad/docker-py-kms/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=thespad&message=GitHub%20Package&logo=github)](https://github.com/thespad/docker-py-kms/packages)
[![Image Size](https://img.shields.io/docker/image-size/thespad/py-kms/latest?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Size)](#)
[![Docker Pulls](https://img.shields.io/docker/pulls/thespad/py-kms.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/thespad/py-kms)
[![Docker Stars](https://img.shields.io/docker/stars/thespad/py-kms.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/thespad/py-kms)
[![License](https://img.shields.io/github/license/thespad/docker-py-kms?color=94398d&logo=Github&logoColor=ffffff&style=for-the-badge)](#)
[![Commits](https://img.shields.io/github/commits-since/thespad/docker-py-kms/latest?color=94398d&include_prereleases&logo=github&style=for-the-badge)](#)

[py-kms](https://github.com/Py-KMS-Organization/py-kms) is a port of node-kms created by cyrozap, which is a port of either the C#, C++, or .NET implementations of KMS Emulator. The original version was written by CODYQX4 and is derived from the reverse-engineered code of Microsoft's official KMS. This version of py-kms is for itself a fork of the original implementation by SystemRage, which was abandoned early 2021.

These are my own builds of the Minimal image using the [LSIO base](https://github.com/linuxserver/docker-baseimage-alpine) and s6 because the upstream project keeps accepting PRs for the entrypoint script that change their behaviour in ways that break the container.

## Versions

* **09.12.21:** - New container build from LSIO Alpine 3.15 base.
* **01.09.21:** - Initial Release.
