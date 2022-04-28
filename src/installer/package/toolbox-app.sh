#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora | ubuntu)
        custom_install_scripts+=(
            'TOOLBOX_APP_LATEST_URL=$(curl -s https://data.services.jetbrains.com/products/releases\?code=TBA\&latest=true\&type=release | jq -r ".TBA[0].downloads.linux.link")'
            'wget $TOOLBOX_APP_LATEST_URL -O /tmp/toolbox-app.tar.gz'
            'sudo mkdir -p /opt/toolbox-app'
            'sudo tar -xf /tmp/toolbox-app.tar.gz --strip-components=1 -C /opt/toolbox-app'
            'sudo ln -s /opt/toolbox-app/jetbrains-toolbox /usr/bin/jetbrains-toolbox'
            '/usr/bin/jetbrains-toolbox'
        )
        ;;
    esac
    ;;
esac
