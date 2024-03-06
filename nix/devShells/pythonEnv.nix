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
    scikit-learn
    seaborn
    wheel
    torchvision
    torchWithRocm
  ];
  runtimePkgs = (with pkgs; [
    glib
    libGL
    libGLU
  ]) ++ (with  pkgs.rocmPackages;[
    clr
    miopen
    rocblas
    rocm-cmake
    rocm-core
    rocm-device-libs
    rocminfo
    rocm-runtime
    rocm-smi
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
