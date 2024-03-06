_: {
  programs.starship = {
    enable = true;
    settings = {
      format = "[ ](bg:#9A348E)$shell$username[](bg:#DA627D fg:#9A348E)$directory[](fg:#DA627D bg:#FCA17D)$git_branch$git_status[](fg:#FCA17D bg:#86BBD8)$c$elixir$elm$golang$haskell$java$julia$nodejs$nim$rust$scala[](fg:#86BBD8 bg:#06969A)$docker_context$nix_shell[](fg:#06969A bg:#33658A)$time[ ](fg:#33658A)";
      add_newline = false;
      aws = {
        style = "bold #ffb86c";
        symbol = "  ";
      };
      buf = {
        symbol = " ";
      };
      character = {
        error_symbol = "[@](bold #ff5555)";
        success_symbol = "[@](bold #50fa7b)";
      };
      cmd_duration = {
        min_time = 0;
        show_milliseconds = true;
        style = "bold #f1fa8c";
      };
      conda = {
        symbol = " ";
      };
      c = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      dart = {
        symbol = " ";
      };
      directory = {
        format = "[ $path ]($style)";
        read_only = " ";
        style = "bold #50fa7b bg:#DA627D";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = " ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };
      docker_context = {
        symbol = " ";
        style = "bg:#06969A";
        format = "[ $symbol $context ]($style) $path";
      };
      elixir = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      elm = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      git_branch = {
        symbol = " ";
        style = "bold #ff79c6 bg:#FCA17D";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        style = "bold #ff5555 bg:#FCA17D";
        format = "[$all_status$ahead_behind ]($style)";
      };
      golang = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      haskell = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      hg_branch = {
        symbol = " ";
      };
      hostname = {
        style = "bold #bd93f9";
        ssh_only = true;
      };
      java = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      julia = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      lua = {
        symbol = " ";
      };
      memory_usage = {
        symbol = " ";
      };
      meson = {
        symbol = "喝 ";
      };
      nim = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      nix_shell = {
        symbol = " ";
      };
      nodejs = {
        symbol = "";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      package = {
        symbol = " ";
      };
      python = {
        symbol = " ";
      };
      rlang = {
        symbol = "ﳒ ";
      };
      ruby = {
        symbol = " ";
      };
      rust = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      scala = {
        symbol = " ";
        style = "bg:#86BBD8";
        format = "[ $symbol ($version) ]($style)";
      };
      shell = {
        disabled = false;
        format = "[$indicator](bg:#9A348E)";
      };
      spack = {
        symbol = "🅢 ";
      };
      status = {
        pipestatus = true;
        disabled = false;
      };
      sudo = {
        disabled = false;
      };
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#33658A";
        format = "[$time]($style)";
      };
      username = {
        disabled = false;
        format = "[$user]($style)";
        show_always = false;
        style_root = "bg:#9A348E";
        style_user = "bold #8be9fd bg:#9A348E";
      };
    };
  };
}
