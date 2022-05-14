#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'python'
            'python-pip'
        )
        ;;
    fedora | ubuntu)
        official_packages+=(
            'python3'
            'python3-pip'
        )
        ;;
    arch | fedora | ubuntu)
        post_official_packages+=(
            'pip install --user awscli localstack localstack-client jupyter pipenv virtualenv'
        )
        ;;
    esac
    ;;
esac
