#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Download md5sum for Ubuntu/Debian
download_md5sum_ubuntu() {
    if command_exists md5sum; then
        echo "md5sum is already installed."
    else
        sudo apt update
        sudo apt install -y coreutils
    fi
}

# Download md5sum for CentOS/RHEL
download_md5sum_centos() {
    if command_exists md5sum; then
        echo "md5sum is already installed."
    else
        sudo yum install -y coreutils
    fi
}

# Download md5sum for macOS
download_md5sum_macos() {
    if command_exists md5sum; then
        echo "md5sum is already installed."
    else
        brew install coreutils
    fi
}

# Download md5sum for Windows (using Chocolatey package manager)
download_md5sum_windows() {
    if command_exists md5sum; then
        echo "md5sum is already installed."
    else
        choco install openssl.light
    fi
}

# Determine the operating system
os_name=$(uname -s)

# Download md5sum based on the operating system
case "$os_name" in
    Linux*)
        if command_exists apt; then
            download_md5sum_ubuntu
        elif command_exists yum; then
            download_md5sum_centos
        else
            echo "Unsupported Linux distribution."
        fi
        ;;
    Darwin*)
        download_md5sum_macos
        ;;
    CYGWIN*|MINGW32*|MSYS*)
        download_md5sum_windows
        ;;
    *)
        echo "Unsupported operating system: $os_name"
        exit 1
        ;;
esac
