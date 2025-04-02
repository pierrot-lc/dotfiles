home-update:
    # home-manager switch -v --flake .
    nh home switch .

system-update:
    # sudo nixos-rebuild switch -v --flake .
    # NOTE: when using `sudo`, nix won't find the user's ssh keys. If not using
    # nh, there's the alternative of first using `nixos-rebuild` without sudo
    # and then relaunch the command with `sudo`. The first time it will fetch
    # deps with user permissions and the second time it will apply the updates.
    nh os switch .

channel-update:
    sudo nix-channel --update
    nix-channel --update

flake-update:
    nix flake update

nvfetcher-update:
    cd home/cli-apps/bat/; nvfetcher; cd -

fwupd-update:
    sudo fwupdmgr update -y

myrepos-update:
    cd ~; mr commit -m myrepos-commit; mr update; mr push; cd -

update-all: channel-update flake-update nvfetcher-update system-update home-update myrepos-update fwupd-update

clean-all:
    # nix-collect-garbage -d
    nh clean all

git-crypt:
    git-crypt unlock

lockfile-pin:
    git add flake.lock
    git commit -m "update: flake.lock"
    git push

options-pin:
    git add hosts/**/options.nix
    git commit -m "update: options"
    git push
