#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'java-1.8.0-openjdk'
            'java-11-openjdk'
            'java-17-openjdk'
        )
        ;;
    ubuntu)
        official_packages+=(
            'openjdk-8-jdk'
            'openjdk-11-jdk'
            'openjdk-17-jdk'
        )
        ;;
    esac
    ;;
esac
