#!/bin/sh

packages_path=$dev_utils_path/installer/package

for package in $(ls $packages_path); do
    source $packages_path/$package
done
