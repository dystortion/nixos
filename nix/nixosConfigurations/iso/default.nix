{ inputs, lib, ... }: {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-plasma5.nix"
    {
      networking = {
        hostName = "illumi";
        hostId = "a2985458";
      };
      nix = {
        #registry = lib.mapAttrs (_: value: { flake = value; }) inputs; # This will add each flake input as a registry
        #nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry; # This will additionally add your inputs to the system's legacy channels
        settings = {
          auto-optimise-store = true;
          experimental-features = [
            "nix-command"
            "flakes"
            "ca-derivations"
          ];
        };
      };
      nixpkgs.config = { allowUnfree = true; };
      isoImage.squashfsCompression = "zstd";
      system.stateVersion = "24.05";
    }
  ];
}
