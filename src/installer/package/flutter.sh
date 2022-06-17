#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'android-platform'
            'android-sdk-build-tools'
            'android-sdk-cmdline-tools-latest'
            'android-sdk-platform-tools'
            'android-sdk'
            'dart'
            'flutter'
        )
        post_official_install_scripts+=(
            'export CHROME_EXECUTABLE=google-chrome-stable'
            'git config --global --add safe.directory /opt/flutter'
            'sudo groupadd android-sdk'
            'sudo chgrp -R android-sdk /opt/android-sdk'
            'sudo usermod -aG android-sdk $USER'
            'sudo usermod -aG flutterusers $USER'
            'sudo -u $USER bash -ci "flutter config --enable-linux-desktop"'
            'sudo -u $USER bash -ci "flutter precache"'
            'sudo -u $USER bash -ci "yes | flutter doctor --android-licenses"'
        )
        ;;&
    fedora | ubuntu)
        custom_install_scripts+=(
            'export CHROME_EXECUTABLE=/var/lib/flatpak/exports/bin/com.google.Chrome'
            'export ANDROID_HOME=/opt/android-sdk'
            'export ANDROID_SDK_ROOT=$ANDROID_HOME'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/emulator'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/tools'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools'
            'curl -LO# https://dl.google.com/android/repository/commandlinetools-linux-8092744_latest.zip --output-dir /tmp --create-dirs'
            'unzip -o /tmp/commandlinetools-linux-8092744_latest.zip -d /tmp'
            'sudo rm -rf $ANDROID_SDK_ROOT'
            'sudo mkdir -p $ANDROID_SDK_ROOT'
            'sudo chmod -R +777 $ANDROID_SDK_ROOT'
            'yes | /tmp/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_ROOT --install "cmdline-tools;latest" "platform-tools"'
            'SDKMANAGER_LIST=$(sdkmanager --list --channel=0)'
            'SDKMANAGER_PLATFORMS=$(echo $SDKMANAGER_LIST | grep -Poi "platforms;android-\d{2}" | sort -r | head -1)'
            'SDKMANAGER_BUILD_TOOLS=$(echo $SDKMANAGER_LIST | grep -Poi "build-tools;[0-9\.]+(?=\s)" | sort -r | head -1)'
            'SDKMANAGER_SYSTEM_IMAGES=$(echo $SDKMANAGER_LIST | grep -Po "system-images;android-\d{2};google_apis;x86_64" | sort -r | head -1)'
            'yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --install "$SDKMANAGER_BUILD_TOOLS" "$SDKMANAGER_PLATFORMS" "$SDKMANAGER_SYSTEM_IMAGES"'
            'yes | sdkmanager --licenses'
            'avdmanager create avd --force --name "Pixel-XL" --device "pixel_xl" --package "$SDKMANAGER_SYSTEM_IMAGES" -p "$ANDROID_SDK_ROOT/.android"'

            'FLUTTER_HOME=/opt/flutter'
            'export PATH="$PATH:$FLUTTER_HOME/bin"'
            'sudo rm -rf $FLUTTER_HOME'
            'sudo git clone -b stable https://github.com/flutter/flutter.git $FLUTTER_HOME'
            'git config --global --add safe.directory $FLUTTER_HOME'
            'sudo chmod -R +777 $FLUTTER_HOME'
            'flutter config --android-sdk $ANDROID_SDK_ROOT'
            'flutter config --enable-linux-desktop'
            'flutter precache'
        )
        ;;&
    arch | fedora | ubuntu)
        environment_variables+=(
            'export FLUTTER_HOME=/opt/flutter'
            'export PATH=$PATH:$FLUTTER_HOME/bin'
            'export ANDROID_HOME=/opt/android-sdk'
            'export ANDROID_SDK_ROOT=$ANDROID_HOME'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/emulator'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/tools'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin'
            'export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools'
        )
        ;;
    esac
    ;;
esac
