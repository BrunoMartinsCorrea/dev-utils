#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'vala'
        )
        ;;&
    ubuntu)
        official_packages+=(
            'valac'
        )
        ;;&
    fedora | ubuntu)
        official_packages+=(
            'ninja-build'
            'meson'
        )
        ;;
    esac
    ;;
esac
