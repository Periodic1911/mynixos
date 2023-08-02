{ config, pkgs, ... }:

{
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # Dark theme
  gtk = {
    enable = true;
    theme.package = pkgs.gnome.gnome-themes-extra;
    theme.name = "Adwaita-dark";
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
