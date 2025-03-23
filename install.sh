#!/bin/bash
set -e

echo "Claude Desktop for Arch Linux - Installation Script"
echo "=================================================="

# Check for Arch-based system
if [ ! -f "/etc/arch-release" ] && ! command -v pacman &>/dev/null; then
    echo "❌ This script requires an Arch-based Linux distribution"
    exit 1
fi

# Install dependencies with sudo
echo "Installing dependencies (may require sudo password)..."
sudo pacman -S --needed --noconfirm base-devel git wget nodejs npm p7zip icoutils imagemagick

# Install electron globally via npm
echo "Installing electron via npm..."
npm install -g electron

# Create build directory
BUILD_DIR="$(pwd)/build"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

# Copy PKGBUILD to build directory
cp PKGBUILD "$BUILD_DIR/"

# Build package as regular user (not root)
echo "Building package..."
cd "$BUILD_DIR"

# Build the package
makepkg -s

if [ $? -eq 0 ]; then
    echo "Package built successfully. Installing with sudo..."
    # Install the built package with sudo
    sudo pacman -U --noconfirm claude-desktop-*.pkg.tar.zst

    if [ $? -eq 0 ]; then
        echo "✓ Claude Desktop has been successfully installed!"
        echo "You can now run it by typing 'claude-desktop' or from your application menu."
    else
        echo "❌ Installation failed. Please check the error messages above."
        exit 1
    fi
else
    echo "❌ Package build failed. Please check the error messages above."
    exit 1
fi
