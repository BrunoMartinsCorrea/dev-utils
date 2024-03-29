#!/bin/bash

OUTPUT_SCRIPT_FILE="$DEV_UTILS_DATA_DIR/script.sh"
OUTPUT_RC_FILE="$DEV_UTILS_DATA_DIR/.zshrc"
OUTPUT_INSTALL_FILE="$DEV_UTILS_DATA_DIR/install.sh"
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
custom_install_scripts=()
end_scripts=()

case "$(uname -s)" in
Linux*)
    OS_NAME='linux'
    DISTRO_NAME=$(cat /etc/*-release | grep -Po "(?<=^ID=).*")

    source "$INSTALLER_PATH/core/any.sh"

    case "$DISTRO_NAME" in
    fedora)
        source "$INSTALLER_PATH/core/fedora.sh"
        ;;
    ubuntu)
        source "$INSTALLER_PATH/core/ubuntu.sh"
        ;;
    *)
        echo "Linux distribution not supported!"
        exit 1
        ;;
    esac
    ;;
Darwin*)
    OS_NAME=mac
    echo "OS not supported!"
    exit 1
    ;;
CYGWIN*)
    OS_NAME=cygwin
    echo "OS not supported!"
    exit 1
    ;;
MINGW*)
    OS_NAME=mingw
    echo "OS not supported!"
    exit 1
    ;;
esac

rm -f "$OUTPUT_SCRIPT_FILE" "$OUTPUT_RC_FILE"

echo '#INIT-SCRIPT' >>"$OUTPUT_SCRIPT_FILE"
for init_script in "${init_scripts[@]}"; do
    echo "$init_script" >>"$OUTPUT_SCRIPT_FILE"
done
echo -e '#INIT-SCRIPT\n' >>"$OUTPUT_SCRIPT_FILE"

echo '#PRE-OFFICIAL-INSTALL-SCRIPT' >>"$OUTPUT_SCRIPT_FILE"
for pre_official_install_script in "${pre_official_install_scripts[@]}"; do
    echo "$pre_official_install_script" >>"$OUTPUT_SCRIPT_FILE"
done
echo -e '#PRE-OFFICIAL-INSTALL-SCRIPT\n' >>"$OUTPUT_SCRIPT_FILE"

echo '#OFFICIAL-PACKAGE-MANAGER' >>"$OUTPUT_SCRIPT_FILE"
echo "$official_package_manager ${official_packages[@]}" >>"$OUTPUT_SCRIPT_FILE"
echo -e '#OFFICIAL-PACKAGE-MANAGER\n' >>"$OUTPUT_SCRIPT_FILE"

echo '#POST-OFFICIAL-INSTALL-SCRIPT' >>"$OUTPUT_SCRIPT_FILE"
for post_official_install_script in "${post_official_install_scripts[@]}"; do
    echo "$post_official_install_script" >>"$OUTPUT_SCRIPT_FILE"
done
echo -e '#POST-OFFICIAL-INSTALL-SCRIPT\n' >>$OUTPUT_SCRIPT_FILE

echo '#PRE-FLATPAK-INSTALL-SCRIPT' >>"$OUTPUT_SCRIPT_FILE"
for pre_flatpak_install_script in "${pre_flatpak_install_scripts[@]}"; do
    echo "$pre_flatpak_install_script" >>$OUTPUT_SCRIPT_FILE
done
echo -e '#PRE-FLATPAK-INSTALL-SCRIPT\n' >>"$OUTPUT_SCRIPT_FILE"

echo '#FLATPAK-PACKAGES' >>"$OUTPUT_SCRIPT_FILE"
echo "sudo flatpak install -y flathub ${flatpak_packages[@]}" >>"$OUTPUT_SCRIPT_FILE"
echo -e '#FLATPAK-PACKAGES\n' >>"$OUTPUT_SCRIPT_FILE"

echo '#POST-FLATPAK-INSTALL-SCRIPT' >>"$OUTPUT_SCRIPT_FILE"
for post_flatpak_install_script in "${post_flatpak_install_scripts[@]}"; do
    echo "$post_flatpak_install_script" >>"$OUTPUT_SCRIPT_FILE"
done
echo -e '#POST-FLATPAK-INSTALL-SCRIPT\n' >>"$OUTPUT_SCRIPT_FILE"

echo '#CUSTOM-INSTALL-SCRIPT' >>"$OUTPUT_SCRIPT_FILE"
for custom_install_script in "${custom_install_scripts[@]}"; do
    echo "$custom_install_script" >>"$OUTPUT_SCRIPT_FILE"
done
echo -e '#CUSTOM-INSTALL-SCRIPT\n' >>"$OUTPUT_SCRIPT_FILE"

echo '#END-SCRIPTS' >>"$OUTPUT_SCRIPT_FILE"
for end_script in "${end_scripts[@]}"; do
    echo "$end_script" >>"$OUTPUT_SCRIPT_FILE"
done
echo -e '#END-SCRIPTS\n' >>$OUTPUT_SCRIPT_FILE

chmod +x "$OUTPUT_SCRIPT_FILE"

for rc_script in "${rc_scripts[@]}"; do
    echo "$rc_script" >>"$OUTPUT_RC_FILE"
done

echo "# INSTALL SCRIPT
chmod +x $OUTPUT_SCRIPT_FILE
$OUTPUT_SCRIPT_FILE

echo '' >~/.zshrc
ZSHRC_PATH=''
if [ -f '/etc/zshrc' ]; then
    ZSHRC_PATH='/etc/zshrc'
elif [ -f '/etc/zsh/zshrc' ]; then
    ZSHRC_PATH='/etc/zsh/zshrc'
else
    ZSHRC_PATH='~/.zshrc'
fi
sudo cp $OUTPUT_RC_FILE \$ZSHRC_PATH
" >"$OUTPUT_INSTALL_FILE"
chmod +x "$OUTPUT_INSTALL_FILE"

clear
echo -e "${GREEN}
╔═══════════════════════════════╗
║ Script generated with success ║
╚═══════════════════════════════╝
${NO_COLOR}"

read -p "Do you want to install it? [Y/n]: " INSTALL_SCRIPT_INPUT

if [ -z "$INSTALL_SCRIPT_INPUT" ] || [ "$INSTALL_SCRIPT_INPUT" == "y" ] || [ "$INSTALL_SCRIPT_INPUT" == "Y" ]; then
    INSTALL_SCRIPT=1
else
    INSTALL_SCRIPT=0
fi

if [ "$INSTALL_SCRIPT" == "1" ]; then
    sh $OUTPUT_INSTALL_FILE
fi
