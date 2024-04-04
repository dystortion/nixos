{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      comfortaa
      corefonts
      fira
      iosevka
      nerdfonts
      noto-fonts
      roboto
    ];
  };
}
