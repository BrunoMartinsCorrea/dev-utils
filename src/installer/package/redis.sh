#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'redis'
            'resp-app'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'app.resp.RESP'
        )
        ;;
    esac
    ;;
esac
