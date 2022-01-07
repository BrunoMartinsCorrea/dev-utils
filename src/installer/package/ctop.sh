#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        custom_install_scripts+=(
            'CTOP_LATEST_VERSION=$(curl -s https://api.github.com/repos/bcicen/ctop/releases/latest | jq -r .tag_name)'
            'sudo wget https://github.com/bcicen/ctop/releases/download/$CTOP_LATEST_VERSION/ctop-$CTOP_LATEST_VERSION-linux-amd64 -O /usr/local/bin/ctop'
            'sudo chmod +x /usr/local/bin/ctop'
        )
        ;;
    esac
    ;;
esac
