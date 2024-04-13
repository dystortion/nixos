{ inputs, ... }: {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-plasma5.nix"
  ];
}
