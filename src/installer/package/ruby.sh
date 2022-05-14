#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    ubuntu)
        official_packages+=(
            'rubygems-integration'
        )
        ;;&
    arch | fedora)
        official_packages+=(
            'rubygems'
        )
        ;;&
    arch | fedora | ubuntu)
        official_packages+=(
            'ruby'
        )
        ;;
    esac
    ;;
esac
