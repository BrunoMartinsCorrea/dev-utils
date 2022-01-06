#!/bin/sh

case "$os_name" in
linux)
    case "$distro_name" in
    fedora)
        custom_install_scripts+=(
            'sudo wget https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-amd64 -O /usr/local/bin/ctop'
            'sudo chmod +x /usr/local/bin/ctop'
        )
        ;;
    esac
    ;;
esac
