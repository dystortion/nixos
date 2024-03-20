{ pkgs, ... }:
{
  environment.systemPackages =
    let
      CLI = with pkgs; [
        age
        any-nix-shell
        aria2
        b3sum
        bat
        bottom
        brightnessctl
        chafa
        choose
        delta
        dprint
        duf
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
        htop
        hyperfine
        imagemagick
        iperf
        lsof
        mediainfo
        mpv
        nmap
        nwjs
        pandoc
        nodePackages.prettier
        procs
        profile-sync-daemon
        q
        rclone
        restic
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
        amdgpu_top
        atuin
        dua
        eza
        ripgrep
        wl-clipboard
        yt-dlp
        zoxide
        ollama
        geekbench
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

      THMS = with pkgs; [
        catppuccin-cursors.mochaMauve
        catppuccin-gtk
        catppuccin-kde
        catppuccin-papirus-folders
      ];

      ROCM = with pkgs.rocmPackages; [
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
    CLI ++ INXI ++ NIX ++ PY ++ JS ++ ROCM ++ THMS;
}
