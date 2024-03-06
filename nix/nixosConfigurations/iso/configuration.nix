{ inputs
, ...
}:
{
  imports = [
    ../illumi/programs/env.nix
    ../illumi/programs/pkgs.nix
    ../illumi/system/fonts.nix
    inputs.nix-index-database.nixosModules.nix-index
    {
      programs.nix-index-database.comma.enable = true;
      programs.command-not-found.enable = false;
    }
  ];
}
