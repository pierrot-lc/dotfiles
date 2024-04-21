{
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "pierrotlc@proton.me";
    userName = "Pierrot LC";
    aliases = {
      a = "add";
      c = "commit";
      d = "diff";
      p = "pull";
      P = "push";
      r = "restore";
      s = "status";
    };
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
    ignores = [
      "**/*.pyc"
      "**/__pycache__"
      ".venv"
    ];
    signing = {
      key = "9FD5351D70EB6A4C";
      signByDefault = true;
    };
  };

  programs.lazygit = {
    enable = true;
  };

  shellAliases = {
    g = "git";
  };
}
