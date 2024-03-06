{ lib, pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./filesystems.nix
  ];

  fileSystems."/nix".options = [ "compress=zstd" "lazytime" ];
  fileSystems."/boot".options = [ "umask=0077" ];

  hardware = {
    bluetooth.enable = true;
    cpu.amd.updateMicrocode = lib.mkDefault true;
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ rocmPackages.clr ];
    };
    pulseaudio.enable = false;
    sensor.hddtemp = {
      enable = true;
      drives = [ "/dev/nvme0n1" ];
    };
  };

  security.rtkit.enable = true;

  services = {
    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
      package = pkgs.openrgb-with-all-plugins;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    smartd.enable = true;
  };
}
