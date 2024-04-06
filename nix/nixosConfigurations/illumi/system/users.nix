_: {
  users = {
    groups.shub.gid = 1000;
    mutableUsers = false;
    users = {
      root.hashedPassword = "$y$j9T$mkzcX82te3.Y9putFpc8S.$qu5cgy4vEVYkMFl0mIwrM7u491JvSCeuGrEvz2aIEv0";
      shub = {
        createHome = true;
        description = "Shubham Sharma";
        group = "shub";
        hashedPassword = "$y$j9T$WQ3MhxMcoketZGZ/lk1Mb.$0AoPhS7GFmKnkLfFRdw3lct5rdCM.7at4lwE0KevQkA";
        home = "/home/shub";
        isNormalUser = true;
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGHwQHKxjUuTMFzwP+Ya0KJMk/jTmC3MB/R+paoatYnR" ];
        uid = 1000;
        extraGroups = [
          "adbusers"
          "aria2"
          "audio"
          "corectrl"
          "keys"
          "libvirtd"
          "networkmanager"
          "render"
          "users"
          "video"
          "wheel"
          "wireshark"
        ];
      };
    };
  };
}
