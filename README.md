# My Dotfiles

## Installation

Here's the steps after a fresh NixOS installation:

1. Install vim and git, and activate flakes.

```sh
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

```sh
git clone git@github.com:pierrot-lc/dotfiles.git
cd dotfiles/
```

3. Setup the system configuration:

 - Create an entry in `./hosts/{host-name}/default.nix`. You can directly copy
   the content from `/etc/nixos/configuration.nix` or take inspiration from
   other hardwares in this repo.
 - Copy the `/etc/nixos/hardware-configuration.nix` file to
   `./hosts/{host-name}/`.
 - Import this file from your `./hosts/{host-name}/default.nix`.
 - Create and setup the file `./hosts/{host-name}/options.nix`.

```nix
  imports = [
    ./hardware-configuration.nix
  ];
```

 - Add this new configuration in the `flake.nix`

```nix
    hosts = {
        [host-name] = null;
        # ...
    }

    nixosConfigurationsParse = {
      [host-name] = ./hosts/{host-name}/configuration.nix;
      # ...
    };

    optionsParser = {
      [host-name] = ./hosts/{host-name}/options.nix;
    };
```

4. Build and switch at boot this new configuration:

```sh
sudo nixos-rebuild boot --flake .#[host-name] -v
```

5. Reboot.
6. Make channels follow unstable (if you want).

```sh
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

nix-channel --update
sudo nix-channel --update
```
7. Install [home-manager](https://nix-community.github.io/home-manager/index.xhtml).
8. This repo uses [git-crypt](https://github.com/AGWA/git-crypt) to hide
   personal information. So to avoid using `home/accounts`, do not set the
   option `accounts.enable` to `true`. This option can be updated later on once
   `gpg` and `git-crypt` dependencies are available.

```sh
home-manager switch --flake .#[your-username] -v
```

9. Install flatpaks from `./notes/flatpak.norg`

And you're good to go!
