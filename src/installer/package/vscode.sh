#!/bin/bash

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
    ubuntu)
        pre_official_install_scripts+=(
            'wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg'
            'sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/'
            'sudo sh -c "echo \"deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main\" > /etc/apt/sources.list.d/vscode.list"'
            'rm -f packages.microsoft.gpg'
        )
        official_packages+=(
            'apt-transport-https'
            'code'
        )
        ;;
    esac
    ;;
esac
