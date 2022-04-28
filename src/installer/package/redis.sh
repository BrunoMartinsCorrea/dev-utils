#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora | ubuntu)
        flatpak_packages+=(
            'app.resp.RESP'
        )
        ;;
    esac
    ;;
esac
