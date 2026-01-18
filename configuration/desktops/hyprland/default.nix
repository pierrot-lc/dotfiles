{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.desktop.name == "Hyprland") {
    # Enable Hyprland.
    programs.hyprland.enable = true;
    programs.hyprland.withUWSM = true;
    # programs.hyprland.package = pkgs.hyprland.overrideAttrs (oldAttrs: {
    #   buildInputs = oldAttrs.buildInputs or [] ++ [pkgs.makeWrapper];
    #   postInstall =
    #     oldAttrs.postInstall or ""
    #     + ''
    #       wrapProgram $out/bin/Hyprland --append-flags "--config ${./hyprland.conf}"
    #     '';
    # });

    services.displayManager.gdm.enable = true;
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "pierrot-lc";

    # Ashell requirements.
    services.upower.enable = true;

    environment.systemPackages = with pkgs; [
      ashell
      brightnessctl
      gnome-text-editor
      hyprlauncher
      hyprlock
      hyprpaper
      hyprshot
      loupe
      nautilus
      papers
      socat
    ];
  };
}
