#!/bin/sh

HOME_MANAGER_PATH="$HOME/.config/home-manager"

rm -rf "$HOME_MANAGER_PATH"
mkdir -p "$HOME_MANAGER_PATH"

cp ./home.nix "$HOME_MANAGER_PATH/"
cp -r ./nvim "$HOME_MANAGER_PATH/"
cp -r ./kitty "$HOME_MANAGER_PATH/"
cp -r ./bash "$HOME_MANAGER_PATH/"
