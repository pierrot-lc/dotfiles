#!/bin/sh

load_rc="
# Loading my .bashrc.d files
. $HOME/.bashrc.d/main.sh
"

# Check if .bashrc is not already contains load_rc
if ! grep -q "Loading my .bashrc.d files" "$HOME/.bashrc"; then
    echo "Add load_rc to .bashrc"
    echo "$load_rc" >> "$HOME/.bashrc"
fi

echo "Copy .bashrc.d directory"
rm -rf "$HOME/.bashrc.d/"
mkdir -p "$HOME/.bashrc.d"
cp ./.bashrc.d/* "$HOME/.bashrc.d/"

echo "Done!"
