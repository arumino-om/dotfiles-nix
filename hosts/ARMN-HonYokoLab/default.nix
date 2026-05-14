{ config, pkgs, ... }: {
  imports = [
    ../../modules/darwin
    ../../modules/darwin/homebrew.nix
  ];

  homebrew.casks = [
    texlive
  ]
}
