#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'qemu-desktop'
        )
        ;;&
    fedora)
        official_packages+=(
            'vi'
            'openssh'
            'gtk3-devel'
            'gtk4-devel'
            'gstreamer1'
            'gstreamer1-libav'
            'gstreamer1-plugins-base'
            'gstreamer1-plugins-good'
            'libaio'
            'libvirt'
            'libvirt-daemon-kvm'
            'virt-install'
            'qemu-kvm'
        )
        ;;&
    ubuntu)
        official_packages+=(
            'vim-tiny'
            'openssh-client'
            'libgtk-3-dev'
            'libgtk-4-dev'
            'gstreamer1.0-tools'
            'gstreamer1.0-libav'
            'gstreamer1.0-plugins-base'
            'gstreamer1.0-plugins-good'
            'libaio1'
            'libvirt-daemon'
            'libvirt-daemon-system'
            'virtinst'
            'qemu-system'
        )
        ;;&
    fedora | ubuntu)
        official_packages+=(
            'crypto-policies'
            'libvirt-daemon-config-network'
            'virt-top'
            'qemu'
        )
        ;;&
    arch | fedora | ubuntu)
        official_packages+=(
            'cmake'
            'tree'
            'vim'
            'nano'
            'curl'
            'xclip'
            'git'
            'zip'
            'unzip'
            'openvpn'
            'ntfs-3g'
            'virt-manager'
            'virt-viewer'
        )
        post_official_install_scripts+=(
            'sudo systemctl start libvirtd'
            'sudo systemctl enable libvirtd'
        )
        ;;
    esac
    ;;
esac
