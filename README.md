# My Dotfiles

## Installation

Here's the steps after a fresh NixOS installation:

1. Install vim and git, and activate flakes.

```console
nix-shell -p vim
sudo vim /etc/nixos/configuration.nix
```

```nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    vim
    git
  ];
```

2. Clone the repo.

```console
git clone git@github.com:pierrot-lc/dotfiles.git
cd dotfiles/
```

3. Setup the system configuration:
-- Create an entry in `./configuration/hardwares/[host-name]/default.nix`. You can directly copy the content from `/etc/nixos/configuration.nix` or take inspiration from other hardwares in this repo.
-- Copy the `/etc/nixos/hardware-configuration.nix` file to `./configuration/hardwares/[host-name]/`
-- Import this file from your `./configuration/hardwares/[host-name]/default.nix`

```nix
  imports = [
    ./hardware-configuration.nix
  ];
```

-- Add this new configuration in the `flake.nix`

```nix
    nixosConfigurations = {
      [host-name] = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration
          ./configuration/hardwares/[host-name]
        ];
      };
```

4. Build and switch at boot this new configuration:

```console
sudo nixos-rebuild boot --flake .#[host-name] -v
```

5. Reboot.
6. Make channels follow unstable (if you want).

```console
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

nix-channel --update
sudo nix-channel --update
```
7. Install [home-manager](https://nix-community.github.io/home-manager/index.xhtml)
8. This repo uses [git-crypt](https://github.com/AGWA/git-crypt) to hide personal information. So to avoid problems, do not import `home/accounts` in your home configuration. Add your user to the list of flake configuration and then update your home-manager packages.

```nix
    homeConfigurations = {
      pierrot-lc = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          username = [your-username];
          theme = "nord";
        };

        modules = [
          ./home
          # ./home/accounts
          ./modules
          inputs.nvim-nix.nixosModules.${system}.default
        ];
      };
    };
```

```console
home-manager switch --flake .#[your-username] -v
```

9. Install flatpaks from `./notes/flatpak.norg`

And you're good to go!
