#!/bin/sh

dev_utils_path=$(dirname $0)
os_name=''
distro_name=''
pre_install_scripts=''
official_package_manager=''
official_packages=''
flatpak_packages=''
snap_packages=''
custom_install_scripts=''
post_install_scripts=''

case "$(uname -s)" in
    Linux*)
        os_name='linux'
        distro_name=$(cat /etc/*-release | grep -Po "(?<=^ID=).*")
        
        case "$distro_name" in
            fedora)
                source $dev_utils_path/installer/core/fedora.sh
                ;;
        esac
        ;;
    Darwin*)
        os_name=mac
        ;;
    CYGWIN*)
        os_name=cygwin
        ;;
    MINGW*)
        os_name=mingw
        ;;
esac

eval "$pre_install_scripts"
eval "$official_package_manager"
eval "$flatpak_packages"
eval "$snap_packages"
eval "$custom_install_scripts"
eval "$post_install_scripts"
