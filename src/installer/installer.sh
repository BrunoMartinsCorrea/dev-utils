#!/bin/sh

OUTPUT_SCRIPT_FILE="$DEV_UTILS_DIR/setup.sh"
OUTPUT_RC_FILE="$DEV_UTILS_DIR/.zshrc"
OS_NAME=''
DISTRO_NAME=''

official_package_manager=''
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
    OS_NAME='linux'
    DISTRO_NAME=$(cat /etc/*-release | grep -Po "(?<=^ID=).*")

    source $INSTALLER_PATH/core/any.sh

    case "$DISTRO_NAME" in
    fedora)
        source $INSTALLER_PATH/core/fedora.sh
        ;;
    esac
    ;;
Darwin*)
    OS_NAME=mac
    ;;
CYGWIN*)
    OS_NAME=cygwin
    ;;
MINGW*)
    OS_NAME=mingw
    ;;
esac

rm -f $OUTPUT_SCRIPT_FILE $OUTPUT_RC_FILE

for init_script in "${init_scripts[@]}"; do
    echo "$init_script" >>$OUTPUT_SCRIPT_FILE
done

for pre_official_install_script in "${pre_official_install_scripts[@]}"; do
    echo "$pre_official_install_script" >>$OUTPUT_SCRIPT_FILE
done

echo "$official_package_manager ${official_packages[@]}" >>$OUTPUT_SCRIPT_FILE

for post_official_install_script in "${post_official_install_scripts[@]}"; do
    echo "$post_official_install_script" >>$OUTPUT_SCRIPT_FILE
done

for pre_flatpak_install_script in "${pre_flatpak_install_scripts[@]}"; do
    echo "$pre_flatpak_install_script" >>$OUTPUT_SCRIPT_FILE
done

echo "sudo flatpak install -y flathub ${flatpak_packages[@]}" >>$OUTPUT_SCRIPT_FILE

for post_flatpak_install_script in "${post_flatpak_install_scripts[@]}"; do
    echo "$post_flatpak_install_script" >>$OUTPUT_SCRIPT_FILE
done

for pre_snap_install_script in "${pre_snap_install_scripts[@]}"; do
    echo "$pre_snap_install_script" >>$OUTPUT_SCRIPT_FILE
done

for snap_package in "${snap_packages[@]}"; do
    echo "sudo snap install $snap_package" >>$OUTPUT_SCRIPT_FILE
done

for post_snap_install_script in "${post_snap_install_scripts[@]}"; do
    echo "$post_snap_install_script" >>$OUTPUT_SCRIPT_FILE
done

for custom_install_script in "${custom_install_scripts[@]}"; do
    echo "$custom_install_script" >>$OUTPUT_SCRIPT_FILE
done

for end_script in "${end_scripts[@]}"; do
    echo "$end_script" >>$OUTPUT_SCRIPT_FILE
done

for rc_script in "${rc_scripts[@]}"; do
    echo "$rc_script" >>$OUTPUT_RC_FILE
done

chmod +x $OUTPUT_SCRIPT_FILE
