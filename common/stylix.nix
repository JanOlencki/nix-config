{pkgs, ...}: {
  stylix.enable = true;
  stylix.image = ../assets/nix-wallpaper-dracula.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  stylix.fonts = {
    serif = {
      name = "Cantarell";
      package = pkgs.cantarell-fonts;
    };

    sansSerif = {
      name = "Cantarell";
      package = pkgs.cantarell-fonts;
    };

    monospace = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts;
    };

    sizes = {
      applications = 12;
      desktop = 12;
    };
  };
}
