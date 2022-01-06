#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'yarnpkg'
        )
        custom_install_scripts+=(
            'curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash'
            'source ~/.nvm/nvm.sh'
            'nvm install --lts'
            'yes | npm install -g @nestjs/cli react-native-cli create-react-app create-next-app vercel @angular/cli @vue/cli vue-native-cli json-server expo-cli netlify-cli tsdx'
        )
        ;;
    esac
    ;;
esac
