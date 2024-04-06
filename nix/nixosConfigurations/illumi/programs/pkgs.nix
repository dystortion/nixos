{ pkgs, ... }:
{
  environment.systemPackages =
    let
      CLI = with pkgs; [
        age
        amdgpu_top
        any-nix-shell
        aria2
        atuin
        b3sum
        bat
        bottom
        brightnessctl
        chafa
        choose
        delta
        dprint
        dua
        duf
        eza
        fastfetch
        fd
        feh
        ffmpeg
        fzf
        gitui
        gopass
        gptfdisk
        grex
        helix
        hexyl
        hyperfine
        imagemagick
        iperf
        lsof
        mediainfo
        megacmd
        mpv
        nmap
        nodePackages.prettier
        nvtopPackages.full
        nwjs
        ollama
        pandoc
        procs
        profile-sync-daemon
        q
        rclone
        restic
        ripgrep
        ryzenadj
        shellcheck
        sops
        sox
        speedtest-cli
        starship
        steam-run
        subdl
        tealdeer
        testdisk
        unar
        unrar
        wl-clipboard
        yt-dlp
        zoxide
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
        nixpkgs-fmt
        nix-du
        nix-tree
        nvd
        statix
      ];

      GUI = with pkgs;[
        betterbird
        discord
        #itch
        keepassxc
        libreoffice-qt
        logseq
        picard
        qbittorrent
        strawberry
        vscodeEnv
        zoom-us
      ];

      THMS = with pkgs; [
        catppuccin-cursors.mochaMauve
        catppuccin-gtk
        catppuccin-kde
        catppuccin-papirus-folders
      ];

      ROCM = with pkgs.rocmPackages_5; [
        clr
        miopen
        rocblas
        rocm-cmake
        rocm-core
        rocm-device-libs
        rocminfo
        rocm-runtime
        rocm-smi
      ];

      JS = with pkgs.nodePackages;[ typescript-language-server ];

      PY = with pkgs.python3Packages; [
        black
        flake8
        jupyter
        matplotlib
        numpy
        pandas
        scikit-learn
        seaborn
        wheel
        torchvision
        torchWithRocm
        python-lsp-server
      ];
    in
    CLI ++ GUI ++ INXI ++ NIX ++ THMS ++ PY ++ JS ++ ROCM;
}
