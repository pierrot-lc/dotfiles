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
      extest.enable = true; # Prevent the "allow remote control" popup window with the steam controller.
      gamescopeSession.enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
    };

    programs.gamemode.enable = true;

    # See https://nixos.wiki/wiki/Appimage and https://nixos.wiki/wiki/Steam.
    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    environment.systemPackages = with pkgs; [
      parsec-bin
      steam-run
    ];
  };
}
