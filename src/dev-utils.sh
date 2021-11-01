#!/bin/sh

dev_utils_path=$(dirname $0)
os_name=''
distro_name=''
official_package_manager=''
pre_install_scripts=()
official_packages=()
flatpak_packages=()
snap_packages=()
custom_install_scripts=()
post_install_scripts=()

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

source $dev_utils_path/installer/core/any.sh

for pre_install_script in "${pre_install_scripts[@]}"; do
    eval "$pre_install_script"
done

eval "$official_package_manager ${official_packages[@]}"

eval "$sudo flatpak install -y flathub ${flatpak_packages[@]}"

for snap_package in "${snap_packages[@]}"; do
    eval "sudo snap install $snap_package"
done

for custom_install_script in "${custom_install_scripts[@]}"; do
    eval "$custom_install_script"
done

for post_install_script in "${post_install_scripts[@]}"; do
    eval "$post_install_script"
done
