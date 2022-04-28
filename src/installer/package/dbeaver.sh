#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora | ubuntu)
        flatpak_packages+=(
            'io.dbeaver.DBeaverCommunity'
        )
        ;;
    esac
    ;;
esac
