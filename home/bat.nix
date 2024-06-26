{
  pkgs,
  config,
  ...
}: let
  catppuccin-frappe = {
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "bat";
      rev = "b8134f01b0ac176f1cf2a7043a5abf5a1a29457b";
      hash = "sha256-gzf0/Ltw8mGMsEFBTUuN33MSFtUP4xhdxfoZFntaycQ=";
    };
    file = "themes/Catppuccin Frappe.tmTheme";
  };
  everforest-dark = {
    src = pkgs.fetchFromGitHub {
      owner = "mhanberg";
      repo = "everforest-textmate";
      rev = "aa1850676e2c2908e7c5cf5ea7863b130fd65016";
      hash = "sha256-4GexSj/T+FKsa98kmKfninJMdFKHgQyZFQGVNBFYIuc=";
    };
    file = "Everforest Dark/Everforest Dark.tmTheme";
  };
  kanagawa = {
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "kanagawa.nvim";
      rev = "7b411f9e66c6f4f6bd9771f3e5affdc468bcbbd2";
      hash = "sha256-kV+hNZ9tgC8bQi4pbVWRcNyQib0+seQrrFnsg7UMdBE=";
    };
    file = "extras/kanagawa.tmTheme";
  };
  rose-pine = {
    src = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "tm-theme";
      rev = "c4235f9a65fd180ac0f5e4396e3a86e21a0884ec";
      hash = "sha256-jji8WOKDkzAq8K+uSZAziMULI8Kh7e96cBRimGvIYKY=";
    };
    file = "dist/themes/rose-pine-moon.tmTheme";
  };
  rose-pine-dawn = {
    src = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "tm-theme";
      rev = "c4235f9a65fd180ac0f5e4396e3a86e21a0884ec";
      hash = "sha256-jji8WOKDkzAq8K+uSZAziMULI8Kh7e96cBRimGvIYKY=";
    };
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

  shellAliases = {
    cat = "bat";
  };
}
