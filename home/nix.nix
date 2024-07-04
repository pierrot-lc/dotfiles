{pkgs, ...}: {
  nix = {
    package = pkgs.nix;
    settings = {
      # Make sure these subtituters and their public keys are defined
      # in the `trusted-substituters` and `trusted-public-keys` nix options.
      # See https://nixos.wiki/wiki/Binary_Cache.
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      warn-dirty = false;
    };
  };

  shellAliases = {
    nd = "nix develop --verbose";
    ns = "nix-shell --verbose";
  };

  nixpkgs.config.allowUnfree = true;

  # Replace command-not-found by nix-index.
  programs.command-not-found.enable = false;
  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.nh.enable = true;

  home.packages = with pkgs; [
    nix-output-monitor
  ];
}
