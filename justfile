home-update:
    home-manager switch -v --flake .
system-update:
    sudo nixos-rebuild switch -v --flake .

clean-home:
    nix-collect-garbage -d
clean-system:
    sudo nix-collect-garbage -d

pin-flake:
    git add flake.lock
    git commit -m "📌 pin: flake.lock"
    git push
