{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mullvad-vpn
    popcorntime
    satty
  ];
}
