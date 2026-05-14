{ config, pkgs, ... }: {
  imports = [
    ../../modules/darwin
    ../../modules/darwin/homebrew.nix
  ];

  # YukariARMN 固有の設定
  homebrew.casks = [
    "imhex"
  ];

  homebrew.brews = [
    "vlmcsd"
  ];
}
