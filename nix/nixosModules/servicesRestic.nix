{ config, inputs, ... }:
let
  user = "user";
  B2 = {
    environmentFile = config.sops.secrets."restic/B2/env".path;
    repositoryFile = config.sops.secrets."restic/B2/repo".path;
  };
  passwordFile = config.sops.secrets."restic/pass".path;
  repositoryFile = config.sops.secrets."restic/repo".path;
  excludeFile = config.sops.secrets."restic/exclude".path;
  dirs = {
    andr = { };
    docs = { };
    home = {
      extraBackupArgs = [
        "--tag=home"
        "--exclude-file=${excludeFile}"
      ];
      paths = [ "/home/${user}" ];
    };
    musc = { };
    pics = { };
    vids = { };
    vnst = { };
  };
  pruneOpts = [
    "--keep-last=10"
    "--keep-hourly=128"
    "--keep-daily=64"
    "--keep-weekly=32"
    "--keep-monthly=16"
    "--keep-yearly=4"
  ];
  timerConfigDaily = timerConfig // {
    OnCalendar = "daily";
  };
  timerConfigWeekly = timerConfig // {
    OnCalendar = "weekly";
  };
  timerConfig = {
    OnCalendar = "hourly";
    RandomizedDelaySec = "5m";
    FixedRandomDelay = "true";
    Persistent = "true";
  };
  sops = {
    owner = config.users.users.${user}.name;
    group = config.users.users.${user}.group;
    sopsFile = inputs.self.outPath + "/secrets/restic.yaml";
  };
in
{
  services = {
    restic.backups = rec {
      home = {
        inherit repositoryFile passwordFile timerConfig user;
        inherit (dirs.home) extraBackupArgs paths;
      };
      homeB2 = home // {
        inherit (B2) environmentFile repositoryFile;
      };
    };
  };

  sops.secrets = {
    "restic/B2/env" = { inherit (sops) owner group sopsFile; };
    "restic/B2/repo" = { inherit (sops) owner group sopsFile; };
    "restic/exclude" = { inherit (sops) owner group sopsFile; };
    "restic/pass" = { inherit (sops) owner group sopsFile; };
    "restic/repo" = { inherit (sops) owner group sopsFile; };
  };
}
