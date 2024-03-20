{ pkgs, ... }: {
  environment = {
    shellAliases = {
      b = "${pkgs.bat}/bin/bat --wrap=never";
      c = "${pkgs.bat}/bin/bat --style=plain --paging=never";
      cp = "${pkgs.coreutils}/bin/cp --verbose --reflink=auto";
      dui = "${pkgs.dua}/bin/dua --stay-on-filesystem interactive";
      g = "${pkgs.git}/bin/git";
      jc = "${pkgs.systemd}/bin/journalctl";
      jcu = "${pkgs.systemd}/bin/journalctl --user";
      l = "${pkgs.eza}/bin/eza --group-directories-first --git --group --long --all";
      le = "${pkgs.eza}/bin/eza --group-directories-first --git";
      lm = "${pkgs.eza}/bin/eza --group-directories-first --git --long --all --sort=modified";
      lx = "${pkgs.eza}/bin/eza --group-directories-first --git --long --all --sort=extension";
      lz = "${pkgs.eza}/bin/eza --group-directories-first --git --long --all --extended";
      mv = "${pkgs.coreutils}/bin/mv --verbose";
      rm = "${pkgs.coreutils}/bin/rm --interactive=once --verbose";
      rs = "${pkgs.rsync}/bin/rsync --verbose --partial --progress";
      sc = "${pkgs.systemd}/bin/systemctl";
      scu = "${pkgs.systemd}/bin/systemctl --user";
      sr = "${pkgs.steam-run}/bin/steam-run";
    };
    variables = rec {
      CARGO_HOME = "${XDG_CACHE_HOME}/cargo";
      EDITOR = "${pkgs.helix}/bin/hx";
      MANPAGER = "${pkgs.bash}/bin/sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
      MANROFFOPT = "-c";
      VISUAL = "${pkgs.helix}/bin/hx";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
    };
  };
}
