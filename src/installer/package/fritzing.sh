#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    *)
        flatpak_packages+=(
            'org.fritzing.Fritzing'
        )
        ;;
    esac
    ;;
esac
