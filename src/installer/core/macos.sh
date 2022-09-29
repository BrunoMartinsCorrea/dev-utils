#!/bin/bash

official_package_manager='sudo softwareupdate -i'

pre_official_install_scripts+=(
    'sudo softwareupdate -i --agree-to-license -a'
    'sudo softwareupdate -i --agree-to-license --install-rosetta'
)
