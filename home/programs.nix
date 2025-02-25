{pkgs, ...}: {
  programs.autojump = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bottom.enable = true;
  home.shellAliases.htop = "btm";

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.fastfetch.enable = true;
  home.shellAliases = {
    neofetch = "fastfetch";
    ff = "fastfetch";
  };

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
      directory.truncate_to_repo = false;
      time.disabled = false;
      nix_shell = {
        format = "via [$symbol(\($name\))]($style) ";
        symbol = " ";
      };
    };
  };

  home.packages = with pkgs; [
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
    pandoc
    protonvpn-gui
    python3Full
    ripgrep
    tldr
    tokei
    tree
    typst
    unzip
    wl-clipboard
    zip
  ];
}
