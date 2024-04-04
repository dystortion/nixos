{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      package = pkgs.gitFull;
      lfs.enable = true;
      config = {
        alias = {
          br = "branch";
          c = "commit";
          ca = "commit -a";
          co = "checkout";
          d = "diff";
          l = "log";
          pl = "pull";
          ps = "push";
          s = "status";
          undo = "reset HEAD~1 --mixed";
        };
        core = {
          editor = "hx";
          pager = "delta";
        };
        delta = {
          line-numbers = true;
          minus-style = "syntax auto";
          navigate = true;
          plus-style = "syntax auto";
          syntax-theme = "Dracula";
        };
        diff = {
          colorMoved = "default";
        };
        init = {
          defaultBranch = "master";
        };
        interactive = {
          diffFilter = "delta --color-only";
        };
        merge = {
          conflictstyle = "diff3";
        };
        pager = {
          diff = "delta";
          log = "delta";
          reflog = "delta";
          show = "delta";
        };
        safe = {
          directory = "/etc/nixos";
        };
        user = {
          email = "dystortion@posteo.net";
          name = "dystortion";
          signingKey = "1E7E5DEF2AACFD7C";
        };
      };
    };
  };
}
