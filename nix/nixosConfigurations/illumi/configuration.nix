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
    inputs.sops-nix.nixosModules.sops
    inputs.self.nixosModules.nixConfig
    inputs.self.nixosModules.base
    inputs.self.nixosModules.restic
    inputs.self.nixosModules.syncthing
  ];
}
