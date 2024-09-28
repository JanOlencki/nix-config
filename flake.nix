{
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    homeConfigurationModules.basic-no-gui = import ./common/home-basic-no-gui.nix;
    stylixModules.no-gui = import ./common/stylix-no-gui.nix;
    stylixModules.fonts = import ./common/stylix-fonts.nix;
  in {
    formatter.${system} = pkgs.alejandra;
    inherit homeConfigurationModules;
    inherit stylixModules;
    homeConfigurations."root" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        homeConfigurationModules.basic-no-gui
        {
          home.username = "root";
          home.homeDirectory = "/root";
          home.stateVersion = "24.05";
        }
      ];
    };
  };
}
