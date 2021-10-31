#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                official_packages+=(
                    'arduino'
                )
                post_install_scripts+=(
                    'sudo usermod -aG dialout $USER'
                )
                ;;
        esac
        ;;
esac
