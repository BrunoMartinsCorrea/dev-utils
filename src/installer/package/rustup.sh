#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        custom_install_scripts+=(
            'curl -fsS https://sh.rustup.rs | sh -s -- -y --profile complete -c rls'
        )
        ;;
    esac
    ;;
esac
