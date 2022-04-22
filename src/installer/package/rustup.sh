#!/bin/bash

case "$OS_NAME" in
linux)
    custom_install_scripts+=(
        'curl -fsS https://sh.rustup.rs | sh -s -- -y --profile complete -c rls'
    )
    ;;
esac
