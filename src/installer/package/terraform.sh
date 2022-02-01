#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'terraform'
            'terraform-ls'
        )
        ;;
    esac
    ;;
esac
