#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora | ubuntu)
        custom_install_scripts+=(
            'YQ_LATEST_VERSION=$(curl -s https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r ".assets[].browser_download_url | select(. | test(\"linux_amd64\$\"))")'
            'sudo wget $YQ_LATEST_VERSION -O /usr/bin/yq'
            'sudo chmod +x /usr/bin/yq'
        )
        ;;
    esac
    ;;
esac
