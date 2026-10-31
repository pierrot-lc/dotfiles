{
  config,
  pkgs,
  pkgs-stable,
  ...
}: {
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {cudaSupport = config.hardware.hasGPU;};
    plugins = with pkgs.obs-studio-plugins; [wlrobs];
  };

  home.packages =
    (with pkgs; [
      drawio
      fractal
      gradia
      keymapp
      mediawriter
      mission-center
      planify
      qbittorrent
      resources
      switcheroo
      ungoogled-chromium
      vlc
    ])
    ++ (with pkgs-stable; [
      jabref
      zotero
    ]);

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
