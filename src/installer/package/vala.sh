#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'ninja'
        )
        ;;&
    ubuntu)
        official_packages+=(
            'valac'
        )
        ;;&
    arch | fedora)
        official_packages+=(
            'vala'
        )
        ;;&
    fedora | ubuntu)
        official_packages+=(
            'ninja-build'
        )
        ;;&
    arch | fedora | ubuntu)
        official_packages+=(
            'meson'
        )
        ;;
    esac
    ;;
esac
