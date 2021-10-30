#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                package_manager=$package_manager' openssl-libs krb5-libs zlib libicu libsecret gnome-keyring desktop-file-utils xprop'
                flatpak_packages=$flatpak_packages' com.visualstudio.code'
                ;;
        esac
        ;;
esac
