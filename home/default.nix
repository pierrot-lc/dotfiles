{
  pkgs,
  username,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";
  nixpkgs.config.allowUnfree = true;

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
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Show news after update.
  news.display = "show";

  xdg.enable = true;

  # Security declarations.
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
    defaultCacheTtl = 86400; # 24 hours.
    defaultCacheTtlSsh = 86400; # 24 hours.
    maxCacheTtl = 86400;
    maxCacheTtlSsh = 86400;
  };
  programs.gpg = {
    enable = true;
  };
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [exts.pass-otp exts.pass-import]);

    settings = {
      PASSWORD_STORE_DIR = "$XDG_DATA_HOME/password-store";
    };
  };

  # For virtualisation using virt-manager and quemu.
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["quemu:///system"];
      uris = ["quemu:///system"];
    };
  };

  imports = [
    ./bash
    ./firefox.nix
    ./git.nix
    ./kitty
    ./newsboat.nix
    ./nvim.nix
    ./programs.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
