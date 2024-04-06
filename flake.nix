{
  description = "My nix config";

  outputs = { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;
      checks.statix = pkgs: "${pkgs.statix}/bin/statix check";
      legacyPackages = pkgs: pkgs;
      nixpkgs.config = { allowUnfree = true; };
      withOverlays = [
        inputs.self.overlays.overrides
        #inputs.self.overlays.unstable
        inputs.self.overlays.vscode
        #inputs.nix-vscode-extensions.overlays.default
      ];
    };

  inputs = {
    # NixOS
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # NixCommunity
    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Encryption
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Catppuccin
    catppuccin-kitty = {
      url = "github:catppuccin/kitty";
      flake = false;
    };
  };
}
