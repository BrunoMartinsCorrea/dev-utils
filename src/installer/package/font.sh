#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'ttf-jetbrains-mono'
            'ttf-fira-code'
            'ttf-nerd-fonts-symbols-mono'
            'noto-fonts-emoji'
        )
        ;;&
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
    arch | fedora | ubuntu)
        official_packages+=(
            'powerline'
        )
        ;;
    esac
    ;;
esac
