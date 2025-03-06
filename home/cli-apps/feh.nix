let
  screen = {
    width = 1920;
    height = 1080;
  };
  window = {
    width = 800;
    height = 600;
  };
  delta = {
    width = screen.width / 2 - window.width / 2;
    height = screen.height / 2 - window.height / 2;
  };

  toString = builtins.toString;
  geometry = "${toString window.width}x${toString window.height}+${toString delta.width}+${toString delta.height}";
in {
  programs.feh = {
    enable = true;
    keybindings = {
      jump_back = "C-u";
      jump_first = "g";
      jump_fwd = "C-d";
      jump_last = "G";
      next_img = ["l" "Right"];
      prev_img = ["h" "Left"];
    };
    themes = {
      default = [
        "--geometry"
        "${geometry}"
        "--borderless"
        "--scale-down"
        "--auto-zoom"
        "--image-bg"
        "black"
      ];
    };
  };

  home.shellAliases.feh = "feh --theme default";
}
