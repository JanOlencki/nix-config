{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-25.11";
    helix.url = "github:helix-editor/helix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      helixOverlay = {
        nixpkgs.overlays = [
          inputs.helix.overlays.helix
        ];
      };
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;

      homeConfigurationModules = {
        default.imports = [
          ./modules/home
        ];

        non-graphical.imports = [
          ./modules/home/non-graphical
        ];
      };

      nixosModules = {
        default = {
          imports = [
            ./modules/nixos
          ];
        }
        // helixOverlay;
      };

      stylixModules = {
        default.imports = [
          ./modules/stylix
        ];
        non-graphical.imports = [
          ./modules/stylix/non-graphical.nix
        ];
      };

      homeConfigurations."root" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          inputs.stylix.homeManagerModules.stylix
          self.stylixModules.non-graphical
          self.homeConfigurationModules.non-graphical
          helixOverlay
          {
            home.username = "root";
            home.homeDirectory = "/root";
            home.stateVersion = "24.05";
          }
        ];
      };
    };
}
