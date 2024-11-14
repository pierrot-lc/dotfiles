{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.gaming.enable {
    nixpkgs.config.allowUnfree = true;

    # See https://nixos.wiki/wiki/Games.
    programs.nix-ld = {
      enable = true;
      # libraries = pkgs.steam-run.fhsenv.args.multiPkgs pkgs;
    };

    # See https://nixos.wiki/wiki/Steam.
    programs.steam = {
      enable = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
    };

    programs.gamemode.enable = true;

    # See https://nixos.wiki/wiki/Appimage.
    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    environment.systemPackages = with pkgs; [
      bottles
      lutris
      mangohud
      parsec-bin
      steam-run
      wineWowPackages.waylandFull
    ];
  };
}
