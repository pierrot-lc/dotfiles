{
  pkgs,
  config,
  ...
}: let
  sources = pkgs.callPackage ./_sources/generated.nix {};

  catppuccin-frappe = {
      src = sources.catppuccin.src;
      file = "themes/Catppuccin Frappe.tmTheme";
    };
  everforest-dark = {
    src = sources.everforest.src;
    file = "Everforest Dark/Everforest Dark.tmTheme";
  };
  kanagawa = {
    src = sources.kanagawa.src;
    file = "extras/kanagawa.tmTheme";
  };
  rose-pine = {
    src = sources.rose-pine.src;
    file = "dist/themes/rose-pine-moon.tmTheme";
  };
  rose-pine-dawn = {
    src = sources.rose-pine.src;
    file = "dist/themes/rose-pine-dawn.tmTheme";
  };

  themeParser = {
    "catppuccin" = "catppuccin-frappe";
    "everforest" = "everforest-dark";
    "gruvbox" = "gruvbox-dark";
    "kanagawa" = "kanagawa";
    "nord" = "Nord";
    "rose-pine" = "rose-pine";
    "rose-pine-dawn" = "rose-pine-dawn";
  };
in {
  programs.bat = {
    enable = true;
    config = {
      theme = themeParser.${config.theme.name};
      italic-text = "always";
    };
    themes = {
      inherit catppuccin-frappe;
      inherit everforest-dark;
      inherit kanagawa;
      inherit rose-pine;
      inherit rose-pine-dawn;
    };
  };

  # Apply the theme for delta as well.
  programs.git.delta.options.syntax-theme = themeParser.${config.theme.name};

  home.shellAliases = {
    cat = "bat";
  };
}
