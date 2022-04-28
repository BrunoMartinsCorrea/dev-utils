#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'https://binaries.webex.com/WebexDesktop-CentOS-Official-Package/Webex.rpm'
        )
        ;;
    ubuntu)
        custom_install_scripts+=(
            'wget -q https://binaries.webex.com/WebexDesktop-Ubuntu-Official-Package/Webex.deb'
            'sudo apt install -y ./Webex.deb'
            'rm -f ./Webex.deb'
        )
        ;;
    esac
    ;;
esac
