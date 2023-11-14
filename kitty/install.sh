#!/bin/sh

echo "Copying the kitty configuration files..."
rm -rf "$HOME/.config/kitty"
mkdir -p "$HOME/.config/kitty"
cp ./*.conf "$HOME/.config/kitty/"

echo "Symlinks to ~/.local/bin/ if necessary..."
if [ -d "$HOME/.local/kitty.app/" ]; then
    ln -s "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/bin/kitty"
    ln -s "$HOME/.local/kitty.app/bin/kitten" "$HOME/.local/bin/kitten"

    echo "Copying .desktop file..."
    cp "./kitty.desktop" "$HOME/.local/share/applications/kitty.desktop"
    echo "Icon=$HOME/.local/kitty.app/share/icons/hicolor/scalable/apps/kitty.svg" >> "$HOME/.local/share/applications/kitty.desktop"
fi


echo "Done"
