#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    *)
        flatpak_packages+=(
            'dev.rdm.RDM'
        )
        ;;
    esac
    ;;
esac
