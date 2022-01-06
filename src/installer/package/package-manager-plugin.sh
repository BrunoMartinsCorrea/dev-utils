#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'dnf-plugins-core'
        )
        ;;
    esac
    ;;
esac
