{ inputs, ... }: {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    ./filesystems.nix
    inputs.self.nixosModules.core
  ];
}
