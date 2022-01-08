#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'yarnpkg'
        )
        custom_install_scripts+=(
            'NVM_LATEST_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r .tag_name)'
            'curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_LATEST_VERSION/install.sh | bash'
            'source ~/.nvm/nvm.sh'
            'nvm install --lts --default'
            'yes | npm install -g nx @nestjs/cli react-native-cli create-react-app create-next-app vercel @angular/cli @vue/cli vue-native-cli json-server expo-cli netlify-cli tsdx'
        )
        ;;
    esac
    ;;
esac
