{ inputs, ... }:
{
  imports = [
    ./hardware
    ./networking
    ./programs
    ./system
    inputs.hardware.nixosModules.common-cpu-amd-pstate
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.nix-index-database.nixosModules.nix-index
    {
      programs = {
        nix-index-database.comma.enable = true;
        command-not-found.enable = false;
      };
    }
    inputs.sops-nix.nixosModules.sops
    ./secrets.nix
    inputs.self.nixosModules.nixConfig
    inputs.self.nixosModules.base
    inputs.self.nixosModules.syncthing
  ];
}
