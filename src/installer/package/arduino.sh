#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                official_package_manager=$official_package_manager' arduino'
                post_install_scripts=$post_install_scripts'
                    sudo usermod -aG dialout $USER
                '
                ;;
        esac
        ;;
esac
