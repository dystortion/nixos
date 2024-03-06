{ inputs
, config
, pkgs
, ...
}:
{
  programs = {
    bash = {
      interactiveShellInit = ''
        eval "$(atuin init bash)"
        eval "$(zoxide init bash)"
      '';
    };
    fish =
      let
        fishFunctions = pkgs.symlinkJoin {
          name = "fishFunctions";
          paths = [
            greetingFunc
            #resticFunc
            #resticB2Func
          ];
        };
        greetingFunc = pkgs.writeTextDir "functions/fish_greeting.fish" ''
          function fish_greeting
              fastfetch
          end
        '';
        resticB2ID = config.age.secrets."resticB2.id".path;
        resticB2Key = config.age.secrets."resticB2.key".path;
        resticB2Repo = config.age.secrets."resticB2.repo".path;
        resticKey = config.age.secrets."restic.key".path;
        resticRepo = config.age.secrets."restic.repo".path;
        resticFunc = pkgs.writeTextDir "functions/rst.fish" ''
          function rst --wraps restic
              set -fx RESTIC_PASSWORD_FILE ${resticKey}
              set -fx RESTIC_FROM_PASSWORD_FILE ${resticKey}
              set -fx RESTIC_REPOSITORY_FILE ${resticRepo}
              set -fx RESTIC_FROM_REPOSITORY_FILE ${resticRepo}
              restic $argv
          end
        '';
        resticB2Func = pkgs.writeTextDir "functions/rstb.fish" ''
          function rstb --wraps restic
              set -fx RESTIC_PASSWORD_FILE ${resticKey}
              set -fx RESTIC_FROM_PASSWORD_FILE ${resticKey}
              set -fx RESTIC_REPOSITORY_FILE ${resticB2Repo}
              set -fx RESTIC_FROM_REPOSITORY_FILE ${resticB2Repo}
              set -fx AWS_ACCESS_KEY_ID (cat ${resticB2ID})
              set -fx AWS_SECRET_ACCESS_KEY (cat ${resticB2Key})
              restic $argv
          end
        '';
      in
      {
        enable = true;
        interactiveShellInit = ''
          set --prepend fish_function_path ${fishFunctions}/functions
          atuin init fish --disable-up-arrow | source
          zoxide init fish | source
        '';
        promptInit = ''
          any-nix-shell fish --info-right | source
        '';
        useBabelfish = true;
      };
  };
}
