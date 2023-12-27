{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mullvad-vpn
    popcorntime
    satty
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
  };

}
