{username, ...}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Show news after update.
  news.display = "show";

  xdg.enable = true;
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = "librewolf.desktop";
    "x-scheme-handler/about" = "librewolf.desktop";
    "x-scheme-handler/http" = "librewolf.desktop";
    "x-scheme-handler/https" = "librewolf.desktop";
    "x-scheme-handler/unknown" = "librewolf.desktop";

    "text/markdown" = "org.gnome.TextEditor.desktop";
    "text/plain" = "org.gnome.TextEditor.desktop";
    "text/x-python" = "org.gnome.TextEditor.desktop";
    "text/x-typst" = "org.gnome.TextEditor.desktop";

    "image/gif" = "org.gnome.Loupe.desktop";
    "image/jpeg" = "org.gnome.Loupe.desktop";
    "image/png" = "org.gnome.Loupe.desktop";
    "image/svg+xml" = "org.gnome.Loupe.desktop";
    "image/webp" = "org.gnome.Loupe.desktop";

    "application/pdf" = "org.gnome.Papers.desktop";
  };

  imports = [
    ./nix.nix
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
