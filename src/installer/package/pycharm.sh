#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    *)
        flatpak_packages+=(
            'com.jetbrains.PyCharm-Community'
        )
        ;;
    esac
    ;;
esac
