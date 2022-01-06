#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        custom_install_scripts+=(
            'sudo wget https://github.com/mikefarah/yq/releases/download/v4.2.0/yq_linux_amd64 -O /usr/bin/yq'
            'sudo chmod +x /usr/bin/yq'
        )
        ;;
    esac
    ;;
esac
