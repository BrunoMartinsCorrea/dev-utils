#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                official_packages+=(
                    'erlang'
                    'elixir'
                )
                ;;
        esac
        ;;
esac