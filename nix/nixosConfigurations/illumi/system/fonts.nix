{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      comfortaa
      corefonts
      crimson
      eunomia
      fira
      hermit
      nerdfonts
      noto-fonts
      poly
      recursive
      roboto
    ];
  };
}
