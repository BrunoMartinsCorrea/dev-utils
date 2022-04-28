#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'jetbrains-mono-fonts-all'
            'fira-code-fonts'
            'google-noto-emoji-color-fonts'
        )
        ;;&
    ubuntu)
        official_packages+=(
            'fonts-jetbrains-mono'
            'fonts-firacode'
            'fonts-noto-color-emoji'
        )
        ;;&
    fedora | ubuntu)
        official_packages+=(
            'powerline'
        )
        ;;
    esac
    ;;
esac
