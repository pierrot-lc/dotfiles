{ pkgs, lib, ... }:

# Thanks to https://github.com/vimjoyer/nvim-nix-video/blob/main/home.nix
# and https://gist.github.com/nat-418/493d40b807132d2643a7058188bff1ca.
repo: pkgs.vimUtils.buildVimPlugin {
  name = "${lib.strings.sanitizeDerivationName repo}";
  src = builtins.fetchGit {
    url = "https://github.com/${repo}.git";
  };
}
