{
  description = "Nix for macOS configuration";

  # format https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html#examples
  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    mkAlias = {
      url = "github:cdmistman/mkAlias";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    nixneovim.url = "github:nixneovim/nixneovim";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-locked.url = "github:NixOS/nixpkgs/1042fd8b148a9105f3c0aca3a6177fd1d9360ba5";
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
      username = "raphael.lemaitre";
      homeDirectory = "/Users/raphael.lemaitre";
    };
    system = "aarch64-darwin"; # apple silicon
  in {
    darwinConfigurations."LMFR0150" = darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules = [
        {
          nixpkgs.overlays = [
            # use selected unstable packages with pkgs.unstable.xyz
            # https://discourse.nixos.org/t/how-to-use-nixos-unstable-for-some-packages-only/36337
            # "https://github.com/ne9z/dotfiles-flake/blob/d3159df136294675ccea340623c7c363b3584e0d/configuration.nix"
            (final: prev: {
              unstable =
                import inputs.nixpkgs-unstable {system = prev.system;};
            })

            (final: prev: {
              # pkgs.unstable-locked.<something>
              unstable-locked =
                import inputs.nixpkgs-locked {system = prev.system;};
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
            # hack around nix-home-manager causing infinite recursion
            isLinux = false;
          };
        }
      ];
    };
  };
}
