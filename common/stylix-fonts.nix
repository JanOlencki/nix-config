{pkgs, ...}: {
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