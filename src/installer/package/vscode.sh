#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                official_packages=(
                    'openssl-libs'
                    'krb5-libs'
                    'zlib'
                    'libicu'
                    'libsecret'
                    'gnome-keyring'
                    'desktop-file-utils'
                    'xprop'
                )
                flatpak_packages+=(
                    'com.visualstudio.code'
                )
                ;;
        esac
        ;;
esac
