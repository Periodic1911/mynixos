{ config, pkgs, nix-colors, ... }:

{
  home.stateVersion = "22.11"; # Please read the comment before changing.

  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.atelier-dune-light;

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
