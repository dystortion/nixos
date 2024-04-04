{ inputs, ... }:
{
  imports = [
    ./fonts.nix
    ./users.nix
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  i18n = {
    defaultLocale = "en_IN";
    extraLocaleSettings = {
      LANGUAGE = "en_IN:en_US:en:C";
      LC_TIME = "C.UTF-8";
    };
    supportedLocales = [ "all" ];
  };

  security = {
    apparmor = {
      enable = true;
      enableCache = true;
    };
    sudo.execWheelOnly = true;
  };

  system = {
    autoUpgrade = {
      enable = false;
      dates = "weekly";
      flags = [
        "--update-input"
        "nixpkgs"
      ];
      flake = inputs.self.outPath;
      operation = "boot";
      randomizedDelaySec = "1h";
    };
  };

  time.timeZone = "Asia/Kolkata";

  virtualisation.libvirtd.enable = true;
}
