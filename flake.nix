{
  description = "rlemaitre's system configuration";

  # format https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html#examples
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mkAlias = {
      url = "github:cdmistman/mkAlias";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixneovim.url = "github:nixneovim/nixneovim";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,
    nixneovim,
    ...
  }: let
    userConfig = {
      fullname = "Raphaël Lemaitre";
      username = "raphael.lemaitre";
      homeDirectory = "/Users/raphael.lemaitre";
      github = "rlemaitre";
      email = "raphael@rlemaitre.com";
    };
    system = "aarch64-darwin"; # apple silicon
    makeMacBookProConfig = name: darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {
          inherit inputs userConfig system;
          hostname = name;
        };
        modules = [
          {
              nixpkgs.overlays = [
              (final: prev: {
                unstable =
                  import inputs.nixpkgs-unstable {system = prev.system;};
              })
              (final: prev: {
                # https://github.com/nix-community/home-manager/issues/1341#issuecomment-1468889352
                mkAlias =
                  inputs.mkAlias.outputs.apps.${prev.system}.default.program;
              })
              nixneovim.overlays.default
            ];
          }
          ./modules/nix-core.nix
          ./modules/system.nix
          ./modules/apps.nix
          ./modules/host-users.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userConfig.username} = {
              imports = [
                nixneovim.nixosModules.default
                ./home/default.nix
              ];
            };
            home-manager.extraSpecialArgs = {
              inherit inputs userConfig;
              hostname = name;
              # hack around nix-home-manager causing infinite recursion
              isLinux = false;
            };
          }
        ];
      };

  in {
    darwinConfigurations = {
      "LMFR0150" = makeMacBookProConfig "LMFR0150";
      athena = makeMacBookProConfig "athena";
    };
  };
}
