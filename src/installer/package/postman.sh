#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'postman-bin'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'com.getpostman.Postman'
        )
        ;;
    esac
    ;;
esac
