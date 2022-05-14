#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'google-chrome'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'com.google.Chrome'
        )
        ;;
    esac
    ;;
esac
