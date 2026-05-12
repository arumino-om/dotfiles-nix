{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    claude-code.url = "github:sadjow/claude-code-nix";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nixpkgs-stable, home-manager, claude-code, ... }:
  let
    supportedSystems = [ "aarch64-darwin" "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#YukariARMN
    darwinConfigurations."YukariARMN" = nix-darwin.lib.darwinSystem {
      modules = [
        ./darwin/default.nix
        home-manager.darwinModules.home-manager
        {
          nixpkgs.overlays = [ claude-code.overlays.default ];
          nixpkgs.config.allowUnfree = true;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.masato = { config, pkgs, lib, ... }: {
            imports = [ ./home/default.nix ];
            home.homeDirectory = lib.mkForce "/Users/masato";
            _module.args.pkgs-stable = import nixpkgs-stable {
              system = "aarch64-darwin";
            };
          };

          home-manager.backupFileExtension = "backup";
        }
      ];
    };
    nixosConfigurations."Jack" = nixpkgs.lib.nixosSystem {
      modules = [
        ./nixos/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.masato = import ./home/default.nix;
        }
      ];
    };
  };
}
