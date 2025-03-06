{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };

  home.packages = with pkgs; [
    keymapp
    protonvpn-gui
  ];

  imports = [
    ./kitty
    ./librewolf.nix
    ./newsboat
    ./newsflash.nix
    ./planify.nix
    ./thunderbird.nix
  ];
}
