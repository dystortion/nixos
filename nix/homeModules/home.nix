{ config, inputs, pkgs, lib, ... }:
let
  user = "user";
in
{
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.05";
    shellAliases = {
      b = "bat --wrap=never";
      c = "bat --style=plain --paging=never";
      cp = "cp --verbose --reflink=auto";
      dui = "dua --stay-on-filesystem interactive";
      g = "git";
      jc = "journalctl";
      jcu = "journalctl --user";
      l = "eza --long --group --all";
      le = "eza";
      lm = "l --sort=modified";
      lx = "l --sort=extension";
      lz = "l --extended";
      mv = "mv --verbose";
      rm = "rm --interactive=once --verbose";
      rs = "rsync --verbose --partial --progress";
      sc = "systemctl";
      scu = "systemctl --user";
      sr = "steam-run";
    };
    packages =
      let
        CLI = with pkgs; [
          amdgpu_top
          brightnessctl
          rage
          b3sum
          choose
          dua
          duf
          fastfetch
          fd
          glow
          hyperfine
          iperf
          mediainfo
          megacmd
          nodePackages.prettier
          procs
          q
          rclone
          restic
          sd
          sops
          grex
          hexyl
          shellcheck
          python3Packages.ipython
          ollama
          nwjs
          nvtopPackages.full
          chafa
          ffmpeg
          sox
          speedtest-cli
          unar
        ];
        GUI = with pkgs;[
          airshipper
          discord
          #itch
          keepassxc
          libreoffice-qt
          logseq
          mullvad-browser
          picard
          qbittorrent
          strawberry
          zoom-us
          steam-run
          #wine
          wineWowPackages.full
          wl-clipboard
        ];
        INXI = with pkgs; [
          inxi
          bluez-tools
          dmidecode
          file
          freeipmi
          glxinfo
          hddtemp
          ipmitool
          lm_sensors
          smartmontools
          tree
          usbutils
          wmctrl
          xorg.xdpyinfo
        ];
        NIX = with pkgs; [
          manix
          nil
          nixd
          nixpkgs-fmt
          nix-du
          nix-tree
          nvd
          statix
        ];
        THMS = with pkgs; [
          catppuccin-cursors.mochaMauve
          catppuccin-gtk
          catppuccin-kde
          catppuccin-papirus-folders
        ];
      in
      CLI ++ GUI ++ INXI ++ NIX ++ THMS ++
      [
        # # Adds the 'hello' command to your environment. It prints a friendly
        # # "Hello, world!" when run.
        # pkgs.hello

        # # It is sometimes useful to fine-tune packages, for example, by applying
        # # overrides. You can do that directly here, just don't forget the
        # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
        # # fonts?
        # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

        # # You can also create simple shell scripts directly inside your
        # # configuration. For example, this adds a command 'my-hello' to your
        # # environment:
        # (pkgs.writeShellScriptBin "my-hello" ''
        #   echo "Hello, ${config.home.username}!"
        # '')
      ];

    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    sessionVariables = {
      CARGO_HOME = "${config.xdg.cacheHome}/cargo";
    };
  };

  #accounts.email.accounts = {    posteo = {      address = "shubhams@posteo.de";    };  };

  catppuccin = {
    accent = "lavender";
    flavour = "mocha";
  };

  editorconfig = {
    enable = true;
    settings = { };
  };

  fonts.fontconfig.enable = true;

  manual = {
    html.enable = true;
    json.enable = true;
    manpages.enable = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode-extension-MS-python-vscode-pylance"
    "cudatoolkit"
    "discord"
    "zoom"
    "steam-run"
    "steam-original"
  ];

  programs = {
    aria2 = {
      enable = true;
      settings = {
        # generic
        dir = "${config.home.homeDirectory}/Downloads";
        max-concurrent-downloads = 4;
        check-integrity = true;
        continue = true;
        always-resume = true;
        disk-cache = "32M";
        disable-ipv6 = true;
        file-allocation = "falloc";
        # HTTP
        enable-http-pipelining = true;
        max-tries = 0;
        min-split-size = "10M";
        retry-wait = 30;
        split = 16;
        timeout = 600;
        # BitTorrent
        bt-force-encryption = true;
        listen-port = 51413;
        dht-listen-port = 51413;
        seed-ratio = 3.0;
      };
    };
    atuin = {
      enable = true;
      flags = [ "--disable-up-arrow" ];
      settings = {
        auto_sync = true;
        search_mode = "fuzzy";
        show_preview = true;
        style = "auto";
        timezone = "local";
        update_check = false;
        workspaces = true;
        stats = {
          common_subcommands = [
            "cargo"
            "docker"
            "git"
            "ip"
            "kubectl"
            "nix"
            "nmcli"
            "npm"
            "podman"
            "systemctl"
          ];
        };
      };
    };
    bash.enable = true;
    bat = {
      enable = true;
      catppuccin.enable = true;
      config = { };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        prettybat
      ];
    };
    bottom = {
      enable = true;
      catppuccin.enable = true;
    };
    boxxy.enable = true;
    bun.enable = true;
    carapace.enable = true;
    cava.enable = true;
    dircolors.enable = true;
    direnv.enable = true;
    eza = {
      enable = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
      git = true;
      icons = true;
    };
    feh.enable = true;
    firefox.enable = true;
    fish = {
      enable = true;
      catppuccin.enable = true;
      functions =
        let
          secretsDir = "{$XDG_RUNTIME_DIR}/secrets/";
          pass = secretsDir + "restic/pass";
          repo = secretsDir + "restic/repo";
          B2 = {
            id = secretsDir + "restic/B2/id";
            key = secretsDir + "restic/B2/key";
            repo = secretsDir + "restic/B2/repo";
          };
        in
        {
          fish_greeting = "fastfetch";
          rst = {
            body = ''
              set -fx RESTIC_PASSWORD_FILE ${pass}
              set -fx RESTIC_FROM_PASSWORD_FILE ${pass}
              set -fx RESTIC_REPOSITORY_FILE ${repo}
              set -fx RESTIC_FROM_REPOSITORY_FILE ${repo}
              restic $argv
            '';
            wraps = "restic";
          };
          rstb = {
            body = ''
              set -fx RESTIC_PASSWORD_FILE ${pass}
              set -fx RESTIC_FROM_PASSWORD_FILE ${pass}
              set -fx RESTIC_REPOSITORY_FILE ${B2.repo}
              set -fx RESTIC_FROM_REPOSITORY_FILE ${B2.repo}
              set -fx AWS_ACCESS_KEY_ID (cat ${B2.id})
              set -fx AWS_SECRET_ACCESS_KEY (cat ${B2.key})
              restic $argv
            '';
            wraps = "restic";
          };
          starship_transient_rprompt_func = "starship module time";
        };
    };
    gh.enable = true;
    git = {
      enable = true;
      aliases = {
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
      delta = {
        enable = true;
        catppuccin.enable = true;
        options = {
          line-numbers = true;
          minus-style = "syntax auto";
          navigate = true;
          plus-style = "syntax auto";
          side-by-side = true;
        };
      };
      extraConfig = {
        init = {
          defaultBranch = "master";
        };
      };
      lfs.enable = true;
      signing = {
        #signByDefault = true;
        key = "1E7E5DEF2AACFD7C";
      };
      userEmail = "dystortion@posteo.net";
      userName = "dystortion";
    };
    git-cliff.enable = true;
    git-credential-oauth.enable = true;
    gitui = {
      enable = true;
      catppuccin.enable = true;
    };
    glamour.catppuccin.enable = true;
    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
      mutableKeys = true;
      mutableTrust = true;
      publicKeys = [ ];
      settings = { };
    };
    helix = {
      enable = true;
      catppuccin.enable = true;
      defaultEditor = true;
    };
    home-manager = {
      enable = true;
      #path = lib.mkForce "${config.home.homeDirectory}/Documents/nixos";
    };
    htop = {
      enable = true;
      settings = {
        account_guest_in_cpu_meter = 1;
        cpu_count_from_one = 1;
        delay = 10;
        detailed_cpu_time = 1;
        hide_userland_threads = 1;
        highlight_base_name = 1;
        highlight_megabytes = 1;
        highlight_threads = 1;
        shadow_distribution_path_prefix = 1;
        shadow_other_users = 1;
        show_cpu_frequency = 1;
        show_cpu_temperature = 1;
        show_thread_names = 1;
        update_process_names = 1;
        fields = with config.lib.htop.fields;
          [
            PID
            USER
            PRIORITY
            NICE
            OOM
            M_SIZE
            M_RESIDENT
            M_SHARE
            STATE
            PERCENT_CPU
            PERCENT_MEM
            TIME
            ELAPSED
            COMM
          ];
      } // (with config.lib.htop; leftMeters [
        (bar "LeftCPUs2")
        (bar "Memory")
        (bar "Swap")
        (bar "DiskIO")
        (bar "NetworkIO")
      ]) // (with config.lib.htop; rightMeters [
        (bar "RightCPUs2")
        (text "Tasks")
        (text "LoadAverage")
        (text "Systemd")
        (text "Uptime")
      ]);
    };
    info.enable = true;
    jq.enable = true;
    jujutsu.enable = true;
    kitty = {
      enable = true;
      catppuccin.enable = true;
      font = {
        name = "Iosevka";
        package = pkgs.iosevka;
        size = 14;
      };
      keybindings = {
        "alt+1" = "goto_tab 1";
        "alt+2" = "goto_tab 2";
        "alt+3" = "goto_tab 3";
        "alt+4" = "goto_tab 4";
        "ctrl+1" = "first_window";
        "ctrl+2" = "second_window";
        "ctrl+3" = "third_window";
        "ctrl+4" = "fourth_window";
        "ctrl+enter" = "new_window";
      };
      settings = {
        background_opacity = "0.8";
        hide_window_decorations = false;
        scrollback_pager_history_size = 100;
        shell = "${pkgs.fish}/bin/fish";
        tab_bar_edge = "bottom";
        tab_bar_min_tabs = 1;
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
      };
    };
    kodi = {
      enable = true;
      datadir = "${config.xdg.dataHome}/kodi";
    };
    looking-glass-client.enable = true;
    man.generateCaches = true;
    mangohud.enable = true;
    nix-index-database.comma.enable = true;
    obs-studio.enable = true;
    pandoc.enable = true;
    pylint.enable = true;
    pywal.enable = true;
    ripgrep.enable = true;
    ruff = {
      enable = true;
      settings = { };
    };
    sioyek.enable = true;
    skim.enable = true;
    sqls.enable = true;
    ssh = {
      enable = true;
      compression = true;
      controlMaster = "auto";
      controlPersist = "10m";
      hashKnownHosts = true;
    };
    starship = {
      enable = true;
      catppuccin.enable = true;
      enableTransience = true;
      settings = {
        format = "$all";
        right_format = ''
          $cmd_duration
          $time
          $status
        '';
        direnv = {
          disabled = false;
        };
        shell = {
          disabled = false;
        };
        shlvl = {
          disabled = false;
        };
        status = {
          disabled = false;
        };
        time = {
          disabled = false;
        };
      };
    };
    tealdeer = {
      enable = true;
      settings = {
        updates = {
          auto_update = true;
        };
      };
    };
    texlive.enable = true;
    thefuck.enable = true;
    thunderbird = {
      enable = true;
      package = pkgs.betterbird;
      profiles = { };
    };
    vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        esbenp.prettier-vscode
        jnoortheen.nix-ide
        ms-pyright.pyright
        ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
      ];
      mutableExtensionsDir = false;
      userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "git.confirmSync" = false;
        "git.autofetch" = true;
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "editor.fontFamily" = "'Iosevka', 'Droid Sans Mono', 'monospace', monospace";
        "editor.fontSize" = 20;
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "explorer.confirmDragAndDrop" = false;
        "nix.formatterPath" = "nixpkgs-fmt";
        "nix.serverSettings" = {
          "nil" = {
            "diagnostics" = {
              "ignored" = [ "unused_binding" "unused_with" ];
            };
            "formatting" = {
              "command" = [ "nixpkgs-fmt" ];
            };
          };
          "nixd" = {
            "formatting" = {
              "command" = "nixpkgs-fmt";
            };
            "options" = {
              "enable" = true;
              "target" = {
                "args" = [ ];
                "installable" = "<flakeref>#nixosConfigurations.<name>.options";
              };
            };
          };
        };
        "editor.semanticHighlighting.enabled" = true;
        "terminal.integrated.minimumContrastRatio" = 1;
        "window.titleBarStyle" = "custom";
        "catppuccin.accentColor" = "lavender";
        "[jsonc]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

      };
    };
    yazi = {
      enable = true;
      catppuccin.enable = true;
      settings = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
      };
    };
    yt-dlp.enable = true;
    zoxide.enable = true;
  };

  #qt.enable = true;

  services = {
    easyeffects.enable = true;
    espanso.enable = true;
    gpg-agent.enable = true;
    kdeconnect = {
      enable = true;
      indicator = false;
      package = pkgs.kdePackages.kdeconnect-kde;
    };
    megasync.enable = false;
    pueue.enable = true;
    ssh-agent.enable = true;
  };

  sops = {
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    #age.sshKeyPaths = [ "${home.homeDirectory}/.ssh/key" ];
    defaultSopsFile = inputs.self.outPath + "/secrets/home.yaml";
    secrets =
      let
        restic = { sopsFile = inputs.self.outPath + "/secrets/restic.yaml"; };
      in
      {
        #path = "%r/test";
        "restic/exclude" = { inherit (restic) sopsFile; };
        "restic/pass" = { inherit (restic) sopsFile; };
        "restic/repo" = { inherit (restic) sopsFile; };
        "restic/B2/id" = { inherit (restic) sopsFile; };
        "restic/B2/key" = { inherit (restic) sopsFile; };
        "restic/B2/repo" = { inherit (restic) sopsFile; };
      };
  };


  xdg = {
    enable = true;
    portal = {
      enable = true;
      configPackages = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
      extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
      xdgOpenUsePortal = true;
    };
  };
}
