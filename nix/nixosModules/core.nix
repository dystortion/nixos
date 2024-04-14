{ config, inputs, lib, pkgs, ... }:
let
  user = "user";
in
{
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.nix-index-database.nixosModules.nix-index
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  environment = {
    systemPackages = with pkgs; [
      #lsof
      #mediainfo
      gptfdisk
      helix
      kitty.terminfo
      nmap
      procs
      q
      ripgrep
      sd
      sops
      testdisk
      unar
    ];
  };

  i18n = {
    defaultLocale = "en_IN";
    extraLocaleSettings = {
      LANGUAGE = "en_IN:en_US:en:C";
      LC_TIME = "C.UTF-8";
    };
    supportedLocales = [ "all" ];
  };

  networking = {
    nameservers = [ "100.100.100.100" "9.9.9.9" ];
    networkmanager = {
      enable = true;
      #wifi.backend = "iwd";
    };
    resolvconf.useLocalResolver = true;
    useDHCP = lib.mkDefault false;
    firewall = {
      enable = true;
      logReversePathDrops = true;
      trustedInterfaces = [ "tailscale0" ];
    };
  };

  nix = {
    extraOptions = ''
      !include ${config.sops.secrets.githubPAT.path}
    '';
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "ca-derivations"
        "flakes"
        "nix-command"
      ];
      trusted-users = [
        "root"
        user
      ];
    };
  };

  programs = {
    command-not-found.enable = false;
    fish.enable = true;
    bandwhich.enable = true;
    iftop.enable = true;
    iotop.enable = true;
    mtr.enable = true;
    nix-ld.enable = true;
    ssh.knownHosts = {
      "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      "codeberg.org".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIVIC02vnjFyL+I4RHfvIGNtOgJMe769VTF1VR4EB3ZB";
    };
    trippy.enable = true;
  };

  security = {
    apparmor = {
      enable = true;
      enableCache = true;
    };
    rtkit.enable = true;
    sudo.execWheelOnly = true;
  };

  services = {
    dnsmasq.enable = true;
    chrony.enable = true;
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
    openssh = {
      enable = true;
      openFirewall = false;
      ports = [ 1717 ];
      settings = {
        LogLevel = "VERBOSE";
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
      sftpFlags = [
        "-f AUTHPRIV"
        "-l INFO"
      ];
      startWhenNeeded = true;
    };
    #opensnitch.enable = true;
    #picosnitch.enable = true;
    tailscale = {
      enable = true;
      extraUpFlags = [ "--accept-dns=false" ];
      useRoutingFeatures = "both";
    };
    vnstat.enable = true;
  };

  system = {
    autoUpgrade = {
      enable = true;
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

  users = {
    groups."${user}".gid = 1000;
    mutableUsers = false;
    users = {
      root.hashedPasswordFile = config.sops.secrets."root".path;
      "${user}" = {
        createHome = true;
        description = "User";
        group = "${user}";
        hashedPasswordFile = config.sops.secrets."user".path;
        home = "/home/${user}";
        isNormalUser = true;
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGHwQHKxjUuTMFzwP+Ya0KJMk/jTmC3MB/R+paoatYnR" ];
        uid = 1000;
        extraGroups = [
          "adbusers"
          "aria2"
          "audio"
          "corectrl"
          "keys"
          "libvirtd"
          "networkmanager"
          "render"
          "users"
          "video"
          "wheel"
          "wireshark"
        ];
      };
    };
  };

  sops.secrets =
    let
      neededForUsers = true;
      sopsFile = inputs.self.outPath + "/secrets/users.yaml";
    in
    {
      root = { inherit neededForUsers sopsFile; };
      user = { inherit neededForUsers sopsFile; };
      githubPAT = {
        sopsFile = inputs.self.outPath + "/secrets/githubPAT.sops";
        format = "binary";
        mode = "0440";
        group = "keys";
      };
    };
}
