{
  boot = {
    initrd = {
      availableKernelModules = [ "virtio_pci" ];
      network = {
        enable = true;
        ssh = {
          enable = true;
          port = 1717;
          authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGHwQHKxjUuTMFzwP+Ya0KJMk/jTmC3MB/R+paoatYnR" ];
          hostKeys = [ "/etc/ssh/ssh_initrd_ed25519_key" ];
        };
      };
      systemd.users.root.shell = "/bin/cryptsetup-askpass";
    };
    kernelParams = [ "ip=dhcp" ];
    loader.grub = {
      enable = true;
      device = "/dev/vda";
    };
    tmp.useTmpfs = true;
  };

  fileSystems = {
    "/".options = [ "mode=755" ];
    "/nix".options = [ "compress=zstd" "lazytime" ];
  };

  networking = {
    hostName = "meruem";
    hostId = "05e44c7f";
  };

  swapDevices = [{
    device = "/swap/file";
  }];

  system.stateVersion = "24.05";
}
