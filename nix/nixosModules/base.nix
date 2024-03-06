{ ... }:
{
  services = {
    aria2 = {
      enable = false;
      downloadDir = "/home/media/aria2";
      extraArguments = "--always-resume=true --check-integrity=true --continue=true --disable-ipv6=true --disk-cache=32M --enable-http-pipelining=true --file-allocation=falloc --max-concurrent-downloads=4 --max-connection-per-server=4 --max-tries=0 --min-split-size=10M --retry-wait=30 --rpc-listen-all=true --split=16 --timeout=600";
    };
    atuin = {
      enable = false;
      openRegistration = true;
    };
    below = {
      enable = true;
      collect.ioStats = true;
      compression.enable = true;
    };
    clamav = {
      daemon = {
        enable = true;
      };
      updater = {
        enable = true;
      };
    };
    chrony.enable = true;
    flatpak.enable = true;
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
    monero = {
      enable = false;
      dataDir = "/home/monero";
    };
    psd.enable = true;
    #touchegg.enable = true;
    #vnstat.enable = true;
    xserver = {
      enable = true;
      desktopManager.plasma6.enable = true;
      deviceSection = ''
        Option "TearFree" "true"
      '';
      displayManager.sddm = {
        enable = true;
      };
      libinput = {
        enable = true;
        touchpad = {
          clickMethod = "clickfinger";
          naturalScrolling = true;
        };
      };
    };
  };
}
