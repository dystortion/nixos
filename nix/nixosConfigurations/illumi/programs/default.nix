{ pkgs, ... }:
{
  imports = [
    ./env.nix
    ./firefox.nix
    ./git.nix
    ./pkgs.nix
    ./shells.nix
    ./starship.nix
  ];

  programs = {
    adb.enable = true;
    bandwhich.enable = true;
    corectrl = {
      enable = true;
      gpuOverclock = {
        enable = true;
        #ppfeaturemask="0xffffffff";
      };
    };
    dconf.enable = true;
    direnv.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    htop.enable = true;
    iftop.enable = true;
    iotop.enable = true;
    kdeconnect.enable = true;
    mtr.enable = true;
    nix-ld.enable = true;
    partition-manager.enable = true;
    trippy.enable = true;
    wavemon.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    virt-manager.enable = true;
    xwayland.enable = true;
    yazi = { enable = true; };
  };
}
