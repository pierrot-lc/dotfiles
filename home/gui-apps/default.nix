{
  config,
  pkgs,
  ...
}: {
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {cudaSupport = config.hardware.hasGPU;};
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
    vlc
    zotero
  ];

  imports = [
    ./ghostty.nix
    ./kitty
    ./libreoffice.nix
    ./librewolf.nix
    ./newsboat
    ./newsflash.nix
    ./proton.nix
    ./thunderbird.nix
  ];
}
