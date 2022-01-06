#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    *)
        flatpak_packages+=(
            'io.github.Figma_Linux.figma_linux'
        )
        ;;
    esac
    ;;
esac
