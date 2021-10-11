#!/bin/sh

os_name=""
distro_name=""

case "$(uname -s)" in
    Linux*)
        os_name=linux
        distro_name=$(cat /etc/*-release | grep -Po "(?<=^ID=).*");;
    Darwin*)
        os_name=mac;;
    CYGWIN*)
        os_name=cygwin;;
    MINGW*)
        os_name=mingw;;
esac

echo "$os_name - $distro_name"
