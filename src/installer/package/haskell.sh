#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'cabal-install'
            'ghc'
            'stack'
        )
        ;;
    fedora | ubuntu)
        official_packages+=(
            'haskell-platform'
        )
        ;;
    esac
    ;;
esac
