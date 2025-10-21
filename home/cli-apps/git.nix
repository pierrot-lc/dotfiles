{config, ...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      alias = {
        a = "add";
        c = "commit";
        d = "diff";
        f = "fetch";
        p = "pull";
        pp = "push";
        r = "restore";
        s = "status";
      };
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rerere.enabled = true;
      user = {
        email = "pierrotlc@proton.me";
        name = "Pierrot LC";
      };
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

  programs.lazygit.enable = true;
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options.syntax-theme = config.programs.bat.config.theme;
  };
}
