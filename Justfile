home-update:
  # home-manager switch -v --flake .
  nh home switch .
system-update:
  # sudo nixos-rebuild switch -v --flake .
  nh os switch .
channel-update:
  sudo nix-channel --update
  nix-channel --update
flake-update:
  nix flake update
nvfetcher-update:
  cd home/bat/; nvfetcher; cd -
fwupd-update:
  sudo fwupdmgr update -y
myrepos-update:
  cd ~; mr commit -m myrepos-commit; mr update; cd -

update-all: channel-update flake-update nvfetcher-update system-update home-update fwupd-update myrepos-update

clean-all:
  # nix-collect-garbage -d
  nh clean all


git-crypt:
  git-crypt unlock

lockfile-pin:
  git add flake.lock
  git commit -m "pin: flake.lock"
  git push
options-pin:
  git add hosts/**/options.nix
  git commit -m "pin: options"
  git push
