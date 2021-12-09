#! /bin/bash

APP_VERSION=$(curl -sX GET https://api.github.com/repos/Py-KMS-Organization/py-kms/commits?sha=master | jq -r 'first(.[] ) | .sha' | cut -c 1-7)

printf "%s" "${APP_VERSION}"