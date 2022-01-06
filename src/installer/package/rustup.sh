#!/bin/sh

case "$os_name" in
linux)
    case "$distro_name" in
    fedora)
        custom_install_scripts+=(
            'curl -fsS https://sh.rustup.rs | sh -s -- -y --profile complete -c rls'
        )
        ;;
    esac
    ;;
esac
