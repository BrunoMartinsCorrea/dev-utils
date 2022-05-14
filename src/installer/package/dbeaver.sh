#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'dbeaver'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'io.dbeaver.DBeaverCommunity'
        )
        ;;
    esac
    ;;
esac
