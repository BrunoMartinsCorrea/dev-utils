#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'teams'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'com.microsoft.Teams'
        )
        ;;
    esac
    ;;
esac
