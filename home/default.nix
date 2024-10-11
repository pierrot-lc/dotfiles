{
  pkgs,
  username,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Show news after update.
  news.display = "show";

  xdg.enable = true;

  # Security declarations.
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [exts.pass-otp exts.pass-import]);

    settings = {
      PASSWORD_STORE_DIR = "$XDG_DATA_HOME/password-store";
    };
  };

  imports = [
    ./bash
    ./bat
    ./buku.nix
    ./calendar.nix
    ./firefox.nix
    ./fzf.nix
    ./git.nix
    ./gnome
    ./gpg.nix
    ./kitty
    ./mails.nix
    ./newsboat.nix
    ./nix.nix
    ./nvim.nix
    ./printing.nix
    ./programs.nix
    ./ssh.nix
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
