#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'jetbrains-mono-fonts-all'
            'powerline'
            'fira-code-fonts'
            'google-noto-emoji-color-fonts'
        )
        ;;
    esac
    ;;
esac
