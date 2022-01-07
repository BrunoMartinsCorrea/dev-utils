#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        custom_install_scripts+=(
            'YQ_LATEST_VERSION=$(curl -s https://api.github.com/repos/mikefarah/yq/releases/latest | jq -r .tag_name)'
            'sudo wget https://github.com/mikefarah/yq/releases/download/$YQ_LATEST_VERSION/yq_linux_amd64 -O /usr/bin/yq'
            'sudo chmod +x /usr/bin/yq'
        )
        ;;
    esac
    ;;
esac
