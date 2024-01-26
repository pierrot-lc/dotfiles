home_update:
    home-manager switch -v --flake .
system_update:
    sudo nixos-rebuild switch -v --flake .

clean_home:
    nix-collect-garbage -d
clean_system:
    sudo nix-collect-garbage -d
