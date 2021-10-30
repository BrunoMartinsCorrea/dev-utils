#!/bin/sh

os_name=''
distro_name=''
pre_install_scripts=''
post_install_scripts=''
official_package_manager=''
official_packages=''
flatpak_packages=''
snap_packages=''

case "$(uname -s)" in
    Linux*)
        os_name=linux
        distro_name=$(cat /etc/*-release | grep -Po "(?<=^ID=).*")
        
        case "$distro_name" in
            fedora)
                official_package_manager='sudo dnf install -y'
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

echo "$os_name - $distro_name"

eval $pre_install_scripts
eval $official_package_manager
eval $flatpak_packages
eval $snap_packages
eval $post_install_scripts
