{ pkgs, ... }:
let
  runtimePkgs = with pkgs.nodePackages; [
    npm
    typescript-language-server
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
