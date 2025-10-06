{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "GNOME") {
    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # Enable automatic login for the user.
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "pierrot-lc";

    services.gnome.gnome-keyring.enable = true;

    # Some general behaviours.
    programs.dconf.enable = true;
    programs.dconf.profiles.user.databases = [
      {
        settings = {
          "org/gnome/TextEditor".restore-session = false;
          "org/gnome/mutter" = {
            dynamic-workspaces = false;
            edge-tiling = false;
          };
          "org/gnome/desktop/wm/preferences".num-workspaces = lib.gvariant.mkUint32 10;
          "org/gnome/shell/app-switcher".current-workspace-only = true;
          "org/gnome/shell/weather".automatic-location = true;
        };
      }
    ];
  };

  imports = [
    ./apps.nix
    ./extensions.nix
    ./keybindings.nix
    ./theme.nix
  ];
}
