{ config, pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };

  home.packages = with pkgs; [
    keymapp
    mullvad-vpn
    popcorntime
    satty
  ];
}
