{
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };

  fileSystems = {
    "/".options = [ "mode=755" ];
    "/nix".options = [ "compress=zstd" "lazytime" ];
  };

  networking = {
    hostName = "meruem";
    hostId = "a2985458";
  };

  system.stateVersion = "24.05";
}
