home-update:
    # home-manager switch -v --flake .
    nh home switch .
system-update:
    # sudo nixos-rebuild switch -v --flake .
    nh os switch .

clean-all:
    # nix-collect-garbage -d
    nh clean all

channel-update:
    sudo nix-channel --update
    nix-channel --update

git-crypt:
    git-crypt unlock

lockfile-pin:
    git add flake.lock
    git commit -m "pin: flake.lock"
    git push

options-update:
    git add hosts/**/options.nix
    git commit -m "update: options"
    git push
