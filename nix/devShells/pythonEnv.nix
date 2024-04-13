{ pkgs, ... }:
let
  pythonPkgs = with pkgs.python3Packages; [
    black
    flake8
    jupyter
    matplotlib
    numpy
    pandas
    pycryptodome
    python-lsp-server
    scikit-learn
    seaborn
    torchvision
    torchWithRocm
    wheel
  ];
  runtimePkgs = (with pkgs; [
    glib
    libGL
    libGLU
  ]) ++ (with  pkgs.rocmPackages;[
    clr
    rocm-core
    rocm-device-libs
    rocm-runtime
    rocm-smi
    rocminfo
  ]);
  std = pkgs.rocmPackages.llvm.rocmClangStdenv;
  pkgSet = pythonPkgs ++ runtimePkgs ++ [ std ];
in
{
  env = {
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath pkgSet;
  };
  inputsFrom = pkgSet;
  packages = pkgSet;
  stdenv = std;
}
