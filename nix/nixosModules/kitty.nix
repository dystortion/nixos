{ inputs, pkgs, ... }:
{
  environment = {
    etc =
      {
        "xdg/kitty/kitty.conf".text = ''
          # Fonts
          font_family      Iosevka
          bold_font        auto
          bold_italic_font auto
          italic_font      auto
          font_size        14.0

          # General
          background_opacity            0.8
          hide_window_decorations       yes
          scrollback_pager_history_size 100
          tab_bar_edge                  bottom
          tab_bar_min_tabs              1
          tab_bar_style                 powerline
          tab_powerline_style           slanted

          # Keymaps
          map alt+1      goto_tab 1
          map alt+2      goto_tab 2
          map alt+3      goto_tab 3
          map alt+4      goto_tab 4
          map ctrl+1     first_window
          map ctrl+2     second_window
          map ctrl+3     third_window
          map ctrl+4     fourth_window
          map ctrl+enter new_window

          # External
          shell ${pkgs.fish}/bin/fish
          include ${inputs.catppuccin-kitty.outPath}/themes/mocha.conf
          include ${inputs.catppuccin-kitty.outPath}/themes/diff-mocha.conf
        '';
      };
    systemPackages = [ pkgs.kitty ];
  };
}
