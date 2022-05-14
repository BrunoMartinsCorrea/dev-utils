#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'discord'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'com.discordapp.Discord'
        )
        ;;
    esac
    ;;
esac
