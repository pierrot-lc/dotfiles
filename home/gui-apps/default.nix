{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [wlrobs];
  };

  home.packages = with pkgs; [
    discord
    drawio
    fractal
    gradia
    jabref
    keymapp
    mediawriter
    mission-center
    planify
    qbittorrent
    resources
    switcheroo
    ungoogled-chromium
    upscaler
    zotero
  ];

  imports = [
    ./ghostty.nix
    ./kitty
    ./libreoffice.nix
    ./librewolf.nix
    ./newsboat
    ./newsflash.nix
    ./thunderbird.nix
  ];
}
