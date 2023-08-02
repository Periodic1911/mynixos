{ config, pkgs, nix-colors, ... }:

{
  home.stateVersion = "22.11"; # Please read the comment before changing.

  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.lib.schemeFromYAML "atelier-plateau-light" (builtins.readFile ./atelier-plateau-light.yaml);
  #colorScheme = nix-colors.colorSchemes.atelier-plateau-light;

  gtk = {
    enable = true;
    theme.package = pkgs.gnome.gnome-themes-extra;
    theme.name = "Adwaita";
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-light";
    };
  };

  programs = {
    kitty = {
      enable = true;
      settings = {
        foreground = "#${config.colorScheme.colors.base05}";
        background = "#${config.colorScheme.colors.base00}";
        color0 = "#${config.colorScheme.colors.base00}";
        color1 = "#${config.colorScheme.colors.base01}";
        color2 = "#${config.colorScheme.colors.base02}";
        color3 = "#${config.colorScheme.colors.base03}";
        color4 = "#${config.colorScheme.colors.base04}";
        color5 = "#${config.colorScheme.colors.base05}";
        color6 = "#${config.colorScheme.colors.base06}";
        color7 = "#${config.colorScheme.colors.base07}";
        color8 = "#${config.colorScheme.colors.base08}";
        color9 = "#${config.colorScheme.colors.base09}";
        color10 = "#${config.colorScheme.colors.base0A}";
        color11 = "#${config.colorScheme.colors.base0B}";
        color12 = "#${config.colorScheme.colors.base0C}";
        color13 = "#${config.colorScheme.colors.base0D}";
        color14 = "#${config.colorScheme.colors.base0E}";
        color15 = "#${config.colorScheme.colors.base0F}";
      };
    };
  };
}
