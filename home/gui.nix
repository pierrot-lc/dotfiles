{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mullvad-vpn
    popcorntime
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
  };

}
