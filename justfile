home-update:
    # home-manager switch -v --flake .
    nh home switch .
system-update:
    # sudo nixos-rebuild switch -v --flake .
    nh os switch .

clean-home:
    # nix-collect-garbage -d
    nh clean user
clean-all:
    nh clean all

channel-update:
    sudo nix-channel --update
    nix-channel --update

git-crypt:
    git-crypt unlock

pin-lockfile:
    git add flake.lock
    git commit -m "pin: flake.lock"
    git push
update-options:
    git add hosts/**/options.nix
    git commit -m "update: options"
    git push
