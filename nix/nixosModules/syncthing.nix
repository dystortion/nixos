{ config, ... }:
let
  user = "shub";
  group = user;
  prefix = "/home/media/";
in
{
  services = {
    syncthing = {
      enable = true;
      cert = config.sops.secrets."syncthing/cert".path;
      key = config.sops.secrets."syncthing/key".path;
      #inherit user      group  ;
      openDefaultPorts = true;
      settings = {
        folders = rec {
          documents = {
            path = prefix + "documents";
            devices = [ "bluejay" ];
            type = "sendonly";
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "1000";
            };
          };
          dcim = documents // {
            path = prefix + "android/dcim";
            type = "receiveonly";
          };
          media = dcim // { path = prefix + "android/media"; };
          music = documents // { path = prefix + "music"; };
          outputs = documents // { path = prefix + "auto1111/outputs"; };
        };
        devices = {
          bluejay.id = "GTJW3R5-FXZJ7FB-PDXB7U4-YEBG3TH-22JFGOL-5NA62SE-LEDZQX7-TF43AQJ";
        };
      };
    };
  };
}
