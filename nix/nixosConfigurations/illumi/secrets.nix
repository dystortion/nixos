{ config, ... }:
let
  syncthing = {
    owner = config.users.users.syncthing.name;
    group = config.users.users.syncthing.group;
    restartUnits = [ "syncthing.service" "syncthing-init.service" ];
  };
in
{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      "syncthing/cert" = { inherit (syncthing) owner group restartUnits; };
      "syncthing/key" = { inherit (syncthing) owner group restartUnits; };
    };
  };
}
