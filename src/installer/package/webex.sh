#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'https://binaries.webex.com/WebexDesktop-CentOS-Official-Package/Webex.rpm'
        )
        ;;
    esac
    ;;
esac
