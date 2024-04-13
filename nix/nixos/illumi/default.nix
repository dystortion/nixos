{ inputs, ... }: {
  system = "x86_64-linux";
  modules = [
    ./filesystems.nix
    ./configuration.nix
    inputs.self.nixosModules.core
    inputs.self.nixosModules.laptop
    #inputs.self.nixosModules.restic
    #inputs.self.nixosModules.syncthing
  ];
}
