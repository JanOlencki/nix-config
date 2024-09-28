{pkgs, ...}: {
  stylix.enable = true;
  stylix.image = ../assets/nix-wallpaper-dracula.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
}
