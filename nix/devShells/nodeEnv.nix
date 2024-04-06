{ pkgs, ... }:
let
  runtimePkgs = with pkgs.nodePackages; [
    npm
  ];
  pkgSet = runtimePkgs;
in
{
  env = {
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath pkgSet;
  };
  inputsFrom = pkgSet;
  packages = pkgSet;
}
