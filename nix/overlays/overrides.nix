final: prev:
let
  catppuccin-variant = "mocha";
  catppuccin-color = "mauve";
in
{
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ catppuccin-color ];
    size = "standard";
    tweaks = [ ];
    variant = catppuccin-variant;
  };
  catppuccin-kde = prev.catppuccin-kde.override {
    flavour = [ catppuccin-variant ];
    accents = [ catppuccin-color ];
    winDecStyles = [
      "modern"
      "classic"
    ];
  };
  catppuccin-papirus-folders = prev.catppuccin-papirus-folders.override {
    flavor = catppuccin-variant;
    accent = catppuccin-color;
  };
  catppuccin-plymouth = prev.catppuccin-plymouth.override { variant = catppuccin-variant; };
  gopass = prev.gopass.override { passAlias = true; };
  nerdfonts = prev.nerdfonts.override {
    fonts = [
      "FiraCode"
      "Iosevka"
    ];
  };
}
