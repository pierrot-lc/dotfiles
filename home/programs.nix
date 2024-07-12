{pkgs, ...}: {
  programs.autojump = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    icons = true;
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.fastfetch.enable = true;
  shellAliases = {neofetch = "fastfetch";};

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      time.disabled = false;
      nix_shell = {
        format = "via [$symbol(\($name\))]($style) ";
        symbol = " ";
      };
    };
  };

  home.packages = with pkgs; [
    bottom
    btop
    comma
    curl
    du-dust
    duf
    fd
    ffmpeg
    file
    gdu
    glances
    glow
    gnumake
    gnutar
    imagemagick
    jq
    just
    keymapp
    mullvad-vpn
    pandoc
    popcorntime
    protonvpn-gui
    python3Full
    ranger
    ripgrep
    sshfs
    tldr
    tokei
    tree
    typst
    unzip
    wl-clipboard
    zip
  ];
}
