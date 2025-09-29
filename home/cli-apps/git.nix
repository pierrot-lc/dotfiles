{config, ...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    delta = {
      enable = true;
      options.syntax-theme = config.programs.bat.config.theme;
    };
    userEmail = "pierrotlc@proton.me";
    userName = "Pierrot LC";
    aliases = {
      a = "add";
      c = "commit";
      d = "diff";
      f = "fetch";
      p = "pull";
      pp = "push";
      r = "restore";
      s = "status";
    };
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rerere.enabled = true;
    };
    ignores = [
      "**/*.pyc"
      "**/__pycache__"
      ".venv"
    ];
    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
  };

  home.shellAliases.g = "git";

  programs.lazygit = {
    enable = true;
  };
}
