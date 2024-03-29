#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora | ubuntu)
        custom_install_scripts+=(
            'curl -s "https://get.sdkman.io" | bash'
            'source "$HOME/.sdkman/bin/sdkman-init.sh"'
            'sed -i "/auto_answer/s/false/true/" ~/.sdkman/etc/config'
            'sed -i "/auto_selfupdate/s/false/true/" ~/.sdkman/etc/config'
            'sed -i "/colour_enable/s/false/true/" ~/.sdkman/etc/config'
            'sed -i "/auto_env/s/false/true/" ~/.sdkman/etc/config'
            'sdk list java | grep -Po "(8|11|17)(\.\d+)+-zulu" | while read -r JAVA_LATEST_MINOR; do'
            '    sdk install java $JAVA_LATEST_MINOR < /dev/null'
            'done'
            'sdk install kotlin < /dev/null'
            'sdk install scala < /dev/null'
            'sdk install groovy < /dev/null'
            'sdk install maven < /dev/null'
            'sdk install gradle < /dev/null'
            'sdk install visualvm < /dev/null'
            'echo "[Desktop Entry]'
            'Name=VisualVM'
            'Type=Application'
            'Categories=Development;'
            'Exec=$HOME/.sdkman/candidates/visualvm/current/bin/visualvm'
            'Icon=$HOME/.sdkman/candidates/visualvm/current/etc/visualvm.icns'
            '" > ~/.local/share/applications/visualvm-sdkman.desktop'
        )
        ;;
    esac
    ;;
esac
