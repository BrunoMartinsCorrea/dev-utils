#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    *)
        flatpak_packages+=(
            'io.dbeaver.DBeaverCommunity'
        )
        ;;
    esac
    ;;
esac
