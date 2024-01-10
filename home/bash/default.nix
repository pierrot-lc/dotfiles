{ config, pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$HOME/go/bin:$PATH"
      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$HOME/.cargo/bin:$PATH"
    '';
    initExtra = builtins.readFile ./init_extra.sh;
    shellAliases = {
      bim = "vim";
      cat = "bat";
      chgrp = "chgrp --preserve-root";
      chmod = "chmod --preserve-root";
      chown = "chown --preserve-root";
      df = "df -h";
      du = "dust";
      dust = "dust --reverse";
      env = "env | sort";
      ff = "find . -name "; # Find a file from the current directory.
      find = "find";
      forecast = "curl wttr.in"; # Show meteo.
      g = "git";
      grep = "rg";
      hsi = "history | grep -i"; # Search in history.
      htop = "btm";
      ip4 = "curl -s https://api.ipify.org";
      ip6 = "curl -s https://api6.ipify.org";
      kk = "ll";
      rm = "rm --preserve-root";
      sl = "ls";
      su = "sudo -i";
      top = "htop";
      wget = "wget -c"; # Resume by default.
      wn = "watch -n 0.5 nvidia-smi"; # Monitor nvidia GPUs.
    };
  };

  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "pstmrtem@outlook.com";
    userName = "Pierrot LC";
    aliases = {
      s = "status";
      d = "diff";
    };
    extraConfig = {
      pull.rebase = true;
      core.editor = "nvim";
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

  home.packages = with pkgs; [
    bat
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
    gnumake
    gnutar
    imagemagick
    just
    neofetch
    pandoc
    python3Full
    ranger
    ripgrep
    sshfs
    unzip
    zip
  ];
}
