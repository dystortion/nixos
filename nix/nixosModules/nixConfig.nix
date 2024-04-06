{ config, inputs, ... }: {

  imports = [ inputs.nix-index-database.nixosModules.nix-index ];

  nix = {
    extraOptions = ''
      !include ${config.sops.secrets.githubPAT.path}
    '';
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
      ];
      trusted-users = [
        "root"
        "shub"
      ];
    };
  };

  programs = {
    #nix-index.enable = true;
    nix-index-database.comma.enable = true;
    command-not-found.enable = false;
  };

  sops.secrets.githubPAT = {
    sopsFile = ./githubPAT.sops;
    format = "binary";
    mode = "0440";
    group = "keys";
  };

  nixpkgs.config = { allowUnfree = true; };
}
