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
      ];
    };
  /*      
      devShells = forAllSystems (
        system:
        let
          pkgs = unstable.legacyPackages.${system};
          std = with pkgs; [
            autoconf
            binutils
            curl
            gcc
            git
            gitRepo
            glib
            gnumake
            gnupg
            gperf
            libcxxStdenv
            libGL
            libGLU
            m4
            ncurses5
            pciutils
            procps
            python3
            ruff
            stdenv.cc
            stdenv.cc.cc
            stdenv.cc.cc.lib
            unzip
            util-linux
          ];
          rocm = with pkgs.rocmPackages; [
            clr
            miopen
            rocblas
            rocm-cmake
            rocm-core
            rocm-device-libs
            rocminfo
            rocm-runtime
            rocm-smi
          ];
          python = with pkgs.python3Packages; [
            black
            flake8
            jupyter
            matplotlib
            numpy
            pandas
            pycryptodome
            scikit-learn
            seaborn
            wheel
          ];
          torch = with pkgs.python3Packages; [
            torchvision
            torchWithRocm
          ];
        in
        {
          pythonEnv = pkgs.mkShell rec {
            buildInputs = std ++ rocm ++ python ++ torch;
            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
          };
        }
      );
    };
    */

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

    # Encryption
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
