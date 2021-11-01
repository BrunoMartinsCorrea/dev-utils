#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                official_packages+=(
                    'cmake'
                    'tree'
                    'vi'
                    'vim'
                    'nano'
                    'curl'
                    'xclip'
                    'git'
                    'zip'
                    'unzip'
                    'openssh'
                    'openvpn'
                    'ntfs-3g'
                    'gstreamer1'
                    'gstreamer1-libav'
                    'gstreamer1-plugins-base'
                    'gstreamer1-plugins-good'
                    'libaio'
                    'libvirt'
                    'libvirt-daemon-config-network'
                    'libvirt-daemon-kvm'
                    'virt-install'
                    'virt-manager'
                    'virt-viewer'
                    'virt-top'
                    'qemu'
                    'qemu-kvm'
                )
                post_install_scripts+=(
                    'sudo systemctl start libvirtd'
                    'sudo systemctl enable libvirtd'
                )
                ;;
        esac
        ;;
esac
