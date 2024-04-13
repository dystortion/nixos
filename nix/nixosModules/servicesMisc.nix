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
    flatpak.enable = true;
    monero = {
      enable = false;
      dataDir = "/home/monero";
    };
  };
}
