#!/bin/bash

PACKAGES_PATH=$INSTALLER_PATH/package
CONFIG_PATH=$INSTALLER_PATH/config/any

environment_variables+=(
    'export PATH=$PATH:$HOME/.local/bin'
)

for package in $(ls "$PACKAGES_PATH"); do
    source "$PACKAGES_PATH/$package"
done

end_scripts+=(
    "echo '' > $HOME/.zshrc"
    "ZSHRC_PATH=''"
    "if [ -f '/etc/zshrc' ]; then"
    "    ZSHRC_PATH=/etc/zshrc"
    "elif [ -f '/etc/zsh/zshrc' ]; then"
    "    ZSHRC_PATH=/etc/zsh/zshrc"
    "else"
    "    ZSHRC_PATH=$HOME/.zshrc"
    "fi"
    "sudo cp $OUTPUT_RC_FILE \$ZSHRC_PATH"
)
