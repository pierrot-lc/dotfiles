{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.virtual-machines.enable {
    # See https://nixos.wiki/wiki/Libvirt.
    virtualisation.libvirtd = {
      # Enable virtualisation support.
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            })
            .fd
          ];
        };
      };
    };

    users.users.pierrot-lc = {
      extraGroups = ["libvirtd"];
      packages = [pkgs.gnome.gnome-boxes];
    };
  };
}
