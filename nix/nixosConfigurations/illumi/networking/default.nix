{ lib, ... }:
{
  imports = [
    #./firewall.nix
  ];

  networking = {
    nameservers = [ "100.100.100.100" ];
    networkmanager = {
      enable = true;
      #wifi.backend = "iwd";
    };
    #resolvconf.useLocalResolver = true;
    useDHCP = lib.mkDefault false;
    firewall = {
      enable = true;
      allowedTCPPortRanges = [ ];
      allowedTCPPorts = [
        #7777 #Terraria
      ];
      allowedUDPPortRanges = [ ];
      allowedUDPPorts = [ ];
      logReversePathDrops = true;
      trustedInterfaces = [ "tailscale0" ];
    };
  };

  services = {
    dnscrypt-proxy2 = {
      enable = false;
      settings = {
        ipv4_servers = true;
        ipv6_servers = false;
        dnscrypt_servers = true;
        doh_servers = true;
        odoh_servers = false;
        require_dnssec = true;
        require_nolog = true;
        require_nofilter = true;
        block_ipv6 = false;
        lb_strategy = "p8";
      };
    };
    #opensnitch.enable = true;
    #picosnitch.enable = true;
    tailscale = {
      enable = true;
      extraUpFlags = [ "--accept-dns=false" ];
      useRoutingFeatures = "both";
    };
  };
}
