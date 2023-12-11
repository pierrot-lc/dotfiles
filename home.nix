{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pierrot-lc";
  home.homeDirectory = "/home/pierrot-lc";
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

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

  imports = [
    ./bash
    ./kitty
    ./nvim
  ];


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # TUI
    comma
    file
    gnutar
    neofetch
    pandoc
    ranger
    unzip
    zip

    # Development tools.
    cmake
    gcc
    gnumake
    just
    nodejs_20
    pdm
    python3Full

    # GUI.
    firefox
    mullvad-vpn
    popcorntime
    thunderbird
    vlc

    # Office suite.
    hunspell
    hunspellDicts.en-us
    hunspellDicts.fr-any
    libreoffice-fresh

    # Installers.
    pipx
    rustup

    # Fonts.
    (nerdfonts.override { fonts = [ "FiraCode" "NerdFontsSymbolsOnly" ]; })
    cantarell-fonts
    commit-mono
    dejavu_fonts
    emojione
    freefont_ttf
    gyre-fonts
    liberation_ttf
    noto-fonts
    source-code-pro
    source-sans
    source-sans-pro
    twemoji-color-font
    twitter-color-emoji
    unifont
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".bashrc.d".source = ./.bashrc.d;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pierrot-lc/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    BROWSER = "firefox";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "pstmrtem@outlook.com";
    userName = "Pierrot LC";
    aliases = {
      s = "status";
      d = "diff";
    };
    extraConfig = {
      pull.rebase = true;
    };
    ignores = [
      "**/*.pyc"
      "**/__pycache__"
      ".venv"
    ];
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  programs.eza = {
    enable = true;
    enableAliases = true;
    icons = true;
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "quemu:///system" ];
      uris = [ "quemu:///system" ];
    };
  };

  # Discover installed fonts by home-manager and enable them.
  # But it masks already installed fonts :(.
  fonts.fontconfig.enable = false;
}
