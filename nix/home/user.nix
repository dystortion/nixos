{ inputs, ... }: {
  system = "x86_64-linux";
  modules = [
    {
      home.stateVersion = "24.05";
    }
    inputs.self.homeModules.home
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.nix-index-database.hmModules.nix-index
    inputs.sops-nix.homeManagerModules.sops
  ];
}
