final: prev:
let
  catppuccin = {
    flavour = "mocha";
    color = "mauve";
  };
in
{
  catppuccin-gtk = prev.catppuccin-gtk.override {
    accents = [ catppuccin.color ];
    size = "standard";
    tweaks = [ ];
    variant = catppuccin.flavour;
  };
  catppuccin-kde = prev.catppuccin-kde.override {
    flavour = [ catppuccin.flavour ];
    accents = [ catppuccin.color ];
    winDecStyles = [
      "modern"
      "classic"
    ];
  };
  catppuccin-papirus-folders = prev.catppuccin-papirus-folders.override {
    flavor = catppuccin.flavour;
    accent = catppuccin.color;
  };
  catppuccin-plymouth = prev.catppuccin-plymouth.override { variant = catppuccin.flavour; };
  gopass = prev.gopass.override { passAlias = true; };
  nerdfonts = prev.nerdfonts.override {
    fonts = [
      "FiraCode"
      "Iosevka"
    ];
  };
}
