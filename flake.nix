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

    # 設定は 4 層に分かれている:
    #   modules/common       … 全OS共通のシステム設定
    #   modules/{darwin,nixos} … OS固有のシステム設定
    #   hosts/<hostName>     … ホスト固有のシステム設定
    #   modules/home/*       … ユーザー固有 (共通 / OS固有 / ユーザーごと)
    mkHost = { hostName, system, class, users ? {}, primaryUser ? null, overlays ? [] }:
    let
      builder  = if class == "darwin"
                 then nix-darwin.lib.darwinSystem
                 else nixpkgs.lib.nixosSystem;
      hmModule = if class == "darwin"
                 then home-manager.darwinModules.home-manager
                 else home-manager.nixosModules.home-manager;
      pkgs-stable = import nixpkgs-stable { inherit system; };
      # primaryUser を明示しなければ users の先頭を使う
      primaryUser' = if primaryUser != null
                     then primaryUser
                     else lib.head (lib.attrNames users);
    in builder {
      specialArgs = {
        inherit hostName users;
        primaryUser = primaryUser';
      };
      modules = [
        ./modules/common          # 共通設定
        ./modules/${class}        # OS固有設定
        ./hosts/${hostName}       # ホスト固有設定
        hmModule
        {
          nixpkgs.hostPlatform = system;
          nixpkgs.overlays = sharedOverlays ++ overlays;
          nixpkgs.config.allowUnfree = true;

          home-manager.useGlobalPkgs       = true;
          home-manager.useUserPackages     = true;
          home-manager.backupFileExtension = ".bkup";
          home-manager.extraSpecialArgs    = { inherit pkgs-stable; };
          # ユーザー固有設定
          home-manager.users = lib.mapAttrs (u: cfg: {
            imports = [
              ./modules/home/common
              ./modules/home/${class}.nix
              ./modules/home/users/${u}.nix
            ] ++ (cfg.roles or []);
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
