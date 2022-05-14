#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'whatsapp-for-linux'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'com.rtosta.zapzap'
        )
        ;;
    esac
    ;;
esac
