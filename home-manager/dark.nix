{ config, pkgs, nix-colors, ... }:

{
  home.stateVersion = "22.11"; # Please read the comment before changing.

  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.lib.schemeFromYAML "shades-of-purple" (builtins.readFile ./shades-of-purple.yaml);

  #Make GTK and QT use dark mode
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

  programs = {
    kitty = {
      enable = true;
      settings = {
        foreground = "#${config.colorScheme.colors.base05}";
        background = "#${config.colorScheme.colors.base00}";
        # ...
      };
    };
  };
}
