{ config, pkgs, ... }:
{
  services = {
    restic.backups =
      let
        user = "shub";
        B2 = {
          environmentFile = config.age.secrets."resticB2.env".path;
          repositoryFile = config.age.secrets."resticB2.repo".path;
        };
        passwordFile = config.age.secrets."restic.key".path;
        repositoryFile = pkgs.writeText "resticRepository" "/home/${user}/.restic";
        excludeFile = config.age.secrets."restic.exclude".path;
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
      in
      rec {
        home = {
          inherit
            repositoryFile
            passwordFile
            timerConfig
            user
            ;
          inherit (dirs.home) extraBackupArgs paths;
        };
        homeB2 = home // {
          inherit (B2) environmentFile repositoryFile;
        };
      };
  };
}
