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
                )
                ;;
        esac
        ;;
esac
