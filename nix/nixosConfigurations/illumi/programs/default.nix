{ pkgs, ... }:
{
  imports = [
    ./env.nix
    ./firefox.nix
    ./git.nix
    ./pkgs.nix
    ./shells.nix
    ./starship.nix
  ];

  programs = {
    adb.enable = true;
    bandwhich.enable = true;
    corectrl = {
      enable = true;
      gpuOverclock = {
        enable = true;
        #ppfeaturemask="0xffffffff";
      };
    };
    dconf.enable = true;
    direnv.enable = true;
    gnupg.agent.enable = true;
    htop = {
      enable = true;
      settings = {
        hide_userland_threads = true;
        shadow_other_users = true;
        show_thread_names = true;
        show_program_path = true;
        highlight_base_name = true;
        highlight_deleted_exe = true;
        shadow_distribution_path_prefix = true;
        detailed_cpu_time = true;
        show_cpu_frequency = true;
        show_cpu_temperature = true;
        update_process_names = true;
        delay = 10;
        column_meters_0 = [ "LeftCPUs2" "Memory" "Zram" "DiskIO" "NetworkIO" ];
        column_meter_modes_0 = [ 1 1 1 1 1 ];
        column_meters_1 = [ "RightCPUs2" "Tasks" "LoadAverage" "Uptime" "Systemd" ];
        column_meter_modes_1 = [ 1 2 2 2 2 ];
      };
    };
    iftop.enable = true;
    iotop.enable = true;
    kdeconnect.enable = true;
    mtr.enable = true;
    nix-ld.enable = true;
    partition-manager.enable = true;
    ssh = {
      startAgent = true;
      knownHosts = {
        "github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
        "codeberg.org".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIVIC02vnjFyL+I4RHfvIGNtOgJMe769VTF1VR4EB3ZB";
      };
    };
    steam.enable = true;
    trippy.enable = true;
    wavemon.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    virt-manager.enable = true;
    xwayland.enable = true;
    yazi = { enable = true; };
  };
}
