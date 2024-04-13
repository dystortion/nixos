{ inputs, ... }: {
  networking = {
    hostName = "illumi";
    hostId = "a2985458";
  };

  isoImage.squashfsCompression = "zstd";

  system.stateVersion = "24.05";
}
