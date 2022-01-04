#!/bin/sh

dev_utils_path=$(dirname $0)
os_name=''
distro_name=''
official_package_manager=''
rc_file='.zshrc'
rc_scripts=()
init_scripts=()
pre_official_install_scripts=()
official_packages=()
post_official_install_scripts=()
pre_flatpak_install_scripts=()
flatpak_packages=()
post_flatpak_install_scripts=()
pre_snap_install_scripts=()
snap_packages=()
post_snap_install_scripts=()
custom_install_scripts=()
end_scripts=()

case "$(uname -s)" in
    Linux*)
        os_name='linux'
        distro_name=$(cat /etc/*-release | grep -Po "(?<=^ID=).*")
        
        source $dev_utils_path/installer/core/any.sh
        
        case "$distro_name" in
            fedora)
                source $dev_utils_path/installer/core/fedora.sh
                ;;
            *)
                source $dev_utils_path/installer/core/any.sh
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

for init_script in "${init_scripts[@]}"; do
    echo "$init_script" >> ~/script.sh
done

for pre_official_install_script in "${pre_official_install_scripts[@]}"; do
    echo "$pre_official_install_script" >> ~/script.sh
done

echo "$official_package_manager ${official_packages[@]}" >> ~/script.sh

for post_official_install_script in "${post_official_install_scripts[@]}"; do
    echo "$post_official_install_script" >> ~/script.sh
done

for pre_flatpak_install_script in "${pre_flatpak_install_scripts[@]}"; do
    echo "$pre_flatpak_install_script" >> ~/script.sh
done

echo "sudo flatpak install -y flathub ${flatpak_packages[@]}" >> ~/script.sh

for post_flatpak_install_script in "${post_flatpak_install_scripts[@]}"; do
    echo "$post_flatpak_install_script" >> ~/script.sh
done

for pre_snap_install_script in "${pre_snap_install_scripts[@]}"; do
    echo "$pre_snap_install_script" >> ~/script.sh
done

for snap_package in "${snap_packages[@]}"; do
    echo "sudo snap install $snap_package" >> ~/script.sh
done

for post_snap_install_script in "${post_snap_install_scripts[@]}"; do
    echo "$post_snap_install_script" >> ~/script.sh
done

for custom_install_script in "${custom_install_scripts[@]}"; do
    echo "$custom_install_script" >> ~/script.sh
done

for end_script in "${end_scripts[@]}"; do
    echo "$end_script" >> ~/script.sh
done

rm -f "$HOME/$rc_file"

for rc_script in "${rc_scripts[@]}"; do
    echo "$rc_script" >> "$HOME/$rc_file"
done
