{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [wlrobs];
  };

  home.packages = with pkgs; [
    jabref
    keymapp
    mediawriter
    protonvpn-gui
  ];

  imports = [
    ./kitty
    ./libreoffice.nix
    ./librewolf.nix
    ./newsboat
    ./newsflash.nix
    ./planify.nix
    ./thunderbird.nix
  ];
}
