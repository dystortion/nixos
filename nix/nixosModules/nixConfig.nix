{ config, ... }: {
  nix = {
    #registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    #nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
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

  sops.secrets.githubPAT = {
    sopsFile = ./githubPAT.sops;
    format = "binary";
    mode = "0440";
    group = "keys";
  };

  nixpkgs.config = { allowUnfree = true; };
}
