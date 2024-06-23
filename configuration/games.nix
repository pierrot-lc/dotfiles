{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.games.enable {
    nixpkgs.config.allowUnfree = true;

    # See https://nixos.wiki/wiki/Games.
    programs.nix-ld = {
      enable = true;
      libraries = pkgs.steam-run.fhsenv.args.multiPkgs pkgs;
    };

    # See https://nixos.wiki/wiki/Steam.
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    programs.gamemode.enable = true;

    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    environment.systemPackages = with pkgs; [
      bottles
      lutris
      mangohud
      steam-run
    ];
  };
}
