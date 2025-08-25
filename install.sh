#!/bin/bash

# install.sh
uri="https://raw.githubusercontent.com/CanvasDeno/VectorXone/refs/heads/main/editor.html"
filename="VectorXone?"
outPath="$(pwd)/$filename"

# Download the file
if command -v curl &> /dev/null; then
    curl -s -o "$outPath" "$uri"
elif command -v wget &> /dev/null; then
    wget -q -O "$outPath" "$uri"
else
    echo "Error: Neither curl nor wget found. Please install one of them."
    exit 1
fi

# Check if download was successful
if [ ! -f "$outPath" ]; then
    echo "Error: Failed to download the file."
    exit 1
fi

echo -e "\nFile downloaded to: $outPath"
read -p "Do you want to install VectorXone in your computer? (Y/N): " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo "Installing VectorXone..."
    installPath="$HOME/TretroBox/Modules"
    mkdir -p "$installPath"
    cp -f "$outPath" "$installPath/"
    echo "Installed to $installPath, Open the file in a web browser to use it."
else
    echo "Installation cancelled. File remains in current directory."
fi
