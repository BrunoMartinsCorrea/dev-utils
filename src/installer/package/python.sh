#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'python3'
            'python3-pip'
        )
        post_official_packages+=(
            'pip install --user awscli localstack localstack-client jupyter pipenv virtualenv'
        )
        ;;
    esac
    ;;
esac
