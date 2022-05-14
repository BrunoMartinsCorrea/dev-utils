#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'telegram-desktop'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'org.telegram.desktop'
        )
        ;;
    esac
    ;;
esac
