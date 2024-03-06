{ pkgs, ... }:
{
  boot = {
    kernelModules = [ "amdgpu" ];
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod; # _stable;
    kernelParams = [
      #"idle=nomwait"
    ];
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      #theme = "catppuccin-mocha";
      themePackages = [ pkgs.catppuccin-plymouth ];
    };
    supportedFilesystems = [ "ntfs" ];
    tmp.useTmpfs = true;
  };
}
