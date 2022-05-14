#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        custom_install_scripts+=(
            'CTOP_LATEST_VERSION=$(curl -s https://api.github.com/repos/bcicen/ctop/releases/latest | jq -r ".assets[].browser_download_url | select(. | test(\"linux-amd\"))")'
            'sudo wget $CTOP_LATEST_VERSION -O /usr/local/bin/ctop'
            'sudo chmod +x /usr/local/bin/ctop'
        )
        ;;
    arch | ubuntu)
        official_packages+=(
            'ctop'
        )
        ;;
    esac
    ;;
esac
