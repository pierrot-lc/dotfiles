#!/bin/sh

HOME_MANAGER_PATH="$HOME/.config/home-manager"
rm -rf "$HOME_MANAGER_PATH"
mkdir -p "$HOME_MANAGER_PATH"
cp ./home.nix "$HOME_MANAGER_PATH/"
cp -r ./nvim "$HOME_MANAGER_PATH/"

mkdir -p "$HOME_MANAGER_PATH/kitty"
cp ./kitty/*.conf "$HOME_MANAGER_PATH/kitty/"

mkdir -p "$HOME_MANAGER_PATH/.bashrc.d"
cp ./bash/.bashrc.d/* "$HOME_MANAGER_PATH/.bashrc.d/"

load_rc="
# Loading my .bashrc.d files
. $HOME/.bashrc.d/main.sh
"

# Check if .bashrc is not already contains load_rc
if ! grep -q "Loading my .bashrc.d files" "$HOME/.bashrc"; then
    echo "Add load_rc to .bashrc"
    echo "$load_rc" >>"$HOME/.bashrc"
fi
