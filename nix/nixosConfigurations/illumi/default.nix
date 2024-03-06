{
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    {
      networking = {
        hostName = "illumi";
        hostId = "a2985458";
      };
      system.stateVersion = "24.05";
    }
  ];
}
