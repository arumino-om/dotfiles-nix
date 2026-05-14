{
  description = "Nix system configurations";

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
    darwinHomeManagerModule = {
      nixpkgs.overlays = [ claude-code.overlays.default ];
      nixpkgs.config.allowUnfree = true;
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.masato = { config, pkgs, lib, ... }: {
        imports = [ ./modules/home ];
        home.homeDirectory = lib.mkForce "/Users/masato";
        _module.args.pkgs-stable = import nixpkgs-stable {
          system = "aarch64-darwin";
        };
      };
      home-manager.backupFileExtension = "backup";
    };

    nixosHomeManagerModule = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.masato = import ./modules/home;
    };

    mkDarwinHost = hostPath: nix-darwin.lib.darwinSystem {
      modules = [
        hostPath
        home-manager.darwinModules.home-manager
        darwinHomeManagerModule
      ];
    };
    
    mkNixOSHost = hostPath: nixpkgs.lib.nixosSystem {
      modules = [
        hostPath
        home-manager.nixosModules.home-manager
        nixosHomeManagerModule
      ];
    };
  in
  {
    darwinConfigurations."YukariARMN" = mkDarwinHost ./hosts/YukariARMN;
    darwinConfigurations."ARMN-HonYokoLab" = mkDarwinHost ./hosts/ARMN-HonYokoLab;
    nixosConfigurations."Jack" = mkNixOSHost ./hosts/Jack;
  };
}
