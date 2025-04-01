{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [wlrobs];
  };

  home.packages = with pkgs; [
    jabref
    keymapp
    mediawriter
    planify
    protonvpn-gui
    ungoogled-chromium
  ];

  imports = [
    ./kitty
    ./libreoffice.nix
    ./librewolf.nix
    ./newsboat
    ./newsflash.nix
    ./thunderbird.nix
  ];
}
