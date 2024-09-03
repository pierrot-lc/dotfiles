{pkgs, ...}: {
  home.packages = [pkgs.librewolf-pkg]; # From my own librewolf derivation.

  home.sessionVariables = {
    BROWSER = "librewolf";
    MOZ_ENABLE_WAYLAND = 1; # Should now be working!
  };
}
