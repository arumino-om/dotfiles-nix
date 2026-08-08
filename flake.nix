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
    lib = nixpkgs.lib;
    sharedOverlays = [ claude-code.overlays.default ];

    mkHost = { hostName, system, class, users ? {}, overlays ? [] }:
    let
      builder  = if class == "darwin"
                 then nix-darwin.lib.darwinSystem
                 else nixpkgs.lib.nixosSystem;
      hmModule = if class == "darwin"
                 then home-manager.darwinModules.home-manager
                 else home-manager.nixosModules.home-manager;
      pkgs-stable = import nixpkgs-stable { inherit system; };
    in builder {
      inherit system;
      modules = [
        ./hosts/${hostName}
        hmModule
        {
          nixpkgs.overlays = sharedOverlays ++ overlays;
          nixpkgs.config.allowUnfree = true;

          home-manager.useGlobalPkgs       = true;
          home-manager.useUserPackages     = true;
          home-manager.backupFileExtension = ".bkup";
          home-manager.extraSpecialArgs    = { inherit pkgs-stable; };
          home-manager.users = lib.mapAttrs (u: cfg: {
            imports = [ ./modules/home/users/${u} ]
              ++ lib.optional (class == "nixos") ./modules/home-nixos/users/${u}
              ++ (cfg.roles or []);
            home.homeDirectory = lib.mkIf (class == "darwin") (lib.mkForce "/Users/${u}");
          }) users;
        }
      ];
    };
  in
  {
    darwinConfigurations."primary" = mkHost {
      hostName = "YukariARMN"; system = "aarch64-darwin"; class = "darwin";
      users = { masato = {}; };
    };

    nixosConfigurations."primary-vm" = mkHost {
      hostName = "Ethan"; system = "aarch64-linux"; class = "nixos";
      users = { masato = {}; };
    };

    darwinConfigurations."lab" = mkHost {
      hostName = "ARMN-HonYokoLab"; system = "aarch64-darwin"; class = "darwin";
      users = { masato = {}; };
    };

    nixosConfigurations."desktop" = mkHost {
      hostName = "Jack"; system = "x86_64-linux"; class = "nixos";
      users = { masato = {}; };
    };

  };
}
