#!/bin/sh

case "$os_name" in
linux)
    case "$distro_name" in
    fedora)
        official_packages+=(
            'https://binaries.webex.com/WebexDesktop-CentOS-Official-Package/Webex.rpm'
        )
        ;;
    esac
    ;;
esac
