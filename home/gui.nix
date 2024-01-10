{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    keymapp
    mullvad-vpn
    popcorntime
    satty
  ];
}
