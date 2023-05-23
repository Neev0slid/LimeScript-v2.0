#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install md5 for Ubuntu/Debian
install_md5_ubuntu() {
    if command_exists md5sum; then
        echo "md5 is already installed."
    else
        sudo apt update
        sudo apt install -y md5sum
    fi
}

# Install md5 for CentOS/RHEL
install_md5_centos() {
    if command_exists md5sum; then
        echo "md5 is already installed."
    else
        sudo yum install -y md5sum
    fi
}

# Install md5 for macOS
install_md5_macos() {
    if command_exists md5; then
        echo "md5 is already installed."
    else
        brew install md5sha1sum
    fi
}

# Install md5 for Windows (using Chocolatey package manager)
install_md5_windows() {
    if command_exists md5; then
        echo "md5 is already installed."
    else
        choco install openssl.light
    fi
}

# Determine the operating system
os_name=$(uname -s)

# Install md5 based on the operating system
case "$os_name" in
    Linux*)
        if command_exists apt; then
            install_md5_ubuntu
        elif command_exists yum; then
            install_md5_centos
        else
            echo "Unsupported Linux distribution."
        fi
        ;;
    Darwin*)
        install_md5_macos
        ;;
    CYGWIN*|MINGW32*|MSYS*)
        install_md5_windows
        ;;
    *)
        echo "Unsupported operating system: $os_name"
        exit 1
        ;;
esac
