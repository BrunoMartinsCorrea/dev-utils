#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'rubygems'
        )
        ;;&
    ubuntu)
        official_packages+=(
            'rubygems-integration'
        )
        ;;&
    fedora | ubuntu)
        official_packages+=(
            'ruby'
        )
        ;;
    esac
    ;;
esac
