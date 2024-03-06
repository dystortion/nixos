_: {
  environment = {
    shellAliases = {
      b = "bat --wrap=never";
      c = "bat --style=plain --paging=never";
      cp = "cp --verbose --reflink=auto";
      dui = "dua --stay-on-filesystem interactive";
      g = "git";
      jc = "journalctl";
      jcu = "journalctl --user";
      l = "eza --group-directories-first --git --group --long --all";
      le = "eza --group-directories-first --git";
      lm = "eza --group-directories-first --git --long --all --sort=modified";
      lx = "eza --group-directories-first --git --long --all --sort=extension";
      lz = "eza --group-directories-first --git --long --all --extended";
      mv = "mv --verbose";
      rm = "rm --interactive=once --verbose";
      rs = "rsync --verbose --partial --progress";
      sc = "systemctl";
      scu = "systemctl --user";
      sr = "steam-run";
    };
    variables = rec {
      CARGO_HOME = "${XDG_CACHE_HOME}/cargo";
      EDITOR = "hx";
      GPODDER_DOWNLOAD_DIR = "${XDG_CACHE_HOME}/gpodder";
      GPODDER_HOME = "${XDG_CONFIG_HOME}/gpodder";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
      PASSWORD_STORE_GENERATED_LENGTH = "50";
      VISUAL = "hx";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
    };
  };
}
