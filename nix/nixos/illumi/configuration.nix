{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod;
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "catppuccin-mocha";
      themePackages = [ pkgs.catppuccin-plymouth ];
    };
    supportedFilesystems = [ "ntfs" ];
    tmp.useTmpfs = true;
  };

  fileSystems = {
    "/".options = [ "mode=755" ];
    "/nix".options = [ "compress=zstd" "lazytime" ];
    "/boot".options = [ "umask=0077" ];
  };

  networking = {
    hostName = "illumi";
    hostId = "a2985458";
  };

  system.stateVersion = "24.05";
}
