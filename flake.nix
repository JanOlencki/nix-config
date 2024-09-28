{
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-24.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    formatter.${system} = pkgs.alejandra;

    homeConfigurationModules.basic-no-gui = import ./common/home-basic-no-gui.nix;
    stylixModules.basic = import ./common/stylix.nix;

    homeConfigurations."root" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        stylix.homeManagerModules.stylix
        ./common/stylix.nix
        ./common/home-basic-no-gui.nix
        {
          home.username = "root";
          home.homeDirectory = "/root";
          home.stateVersion = "24.05";
        }
      ];
    };
  };
}
