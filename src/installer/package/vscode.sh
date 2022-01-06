#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        pre_official_install_scripts+=(
            'sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc'
            'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo'
        )
        official_packages+=(
            'openssl-libs'
            'krb5-libs'
            'zlib'
            'libicu'
            'libsecret'
            'gnome-keyring'
            'desktop-file-utils'
            'xprop'
            'code'
        )
        ;;
    esac
    ;;
esac
