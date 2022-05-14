#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'figma-linux'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'io.github.Figma_Linux.figma_linux'
        )
        ;;
    esac
    ;;
esac
