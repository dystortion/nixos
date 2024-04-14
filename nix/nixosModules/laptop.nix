{ inputs, lib, pkgs, ... }: {

  imports = [
    inputs.hardware.nixosModules.common-cpu-amd-pstate
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-ssd
  ];

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages;[ elisa ];
    systemPackages = with pkgs; [
    ];
  };

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

  hardware = {
    bluetooth.enable = true;
    cpu.amd.updateMicrocode = lib.mkDefault true;
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ rocmPackages.clr ];
    };
    pulseaudio.enable = false;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "corefonts"
    "steam"
    "steam-original"
    "steam-run"
  ];

  programs = {
    adb.enable = true;
    dconf.enable = true;
    corectrl = {
      enable = true;
      gpuOverclock = {
        enable = true;
        #ppfeaturemask="0xffffffff";
      };
    };
    kdeconnect.enable = true;
    partition-manager.enable = true;
    steam.enable = true;
    wavemon.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    virt-manager.enable = true;
    xwayland.enable = true;
  };

  services = {
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
    };
    logind.lidSwitchExternalPower = "ignore";
    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
      package = pkgs.openrgb-with-all-plugins;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    smartd.enable = true;
    xserver = {
      enable = true;
      deviceSection = ''
        Option "TearFree" "true"
      '';
      libinput = {
        enable = true;
        touchpad = {
          clickMethod = "clickfinger";
          naturalScrolling = true;
        };
      };
    };
  };

  virtualisation.libvirtd.enable = true;
}
