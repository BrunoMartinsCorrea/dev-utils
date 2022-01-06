#!/bin/sh

case "$os_name" in
linux)
    case "$distro_name" in
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
