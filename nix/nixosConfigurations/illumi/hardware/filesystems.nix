# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/etc" =
    {
      device = "/dev/disk/by-uuid/e7a66bbe-7be7-4f13-9305-4a0d6f0ae8d3";
      fsType = "btrfs";
      options = [ "subvol=etc" ];
    };

  boot.initrd.luks.devices."CROOT".device = "/dev/disk/by-uuid/8252fa57-8fe0-4f74-bafb-dd99e3184a58";

  boot.initrd.luks.devices."CSWAP".device = "/dev/disk/by-uuid/c7126773-bbb6-450b-ac7f-981b01227b83";

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/e7a66bbe-7be7-4f13-9305-4a0d6f0ae8d3";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/var" =
    {
      device = "/dev/disk/by-uuid/e7a66bbe-7be7-4f13-9305-4a0d6f0ae8d3";
      fsType = "btrfs";
      options = [ "subvol=var" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/e7a66bbe-7be7-4f13-9305-4a0d6f0ae8d3";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/2DEC-8C3B";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/0efea3e3-4968-43ec-a55f-2bbc3203d575"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.tailscale0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
