#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                official_package_manager=$official_package_manager' dnf-plugins-core'
                ;;
        esac
        ;;
esac
