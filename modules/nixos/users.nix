# flake の mkHost に渡した users から NixOS のユーザーを生成する
{ lib, pkgs, users, ... }: {
  users.users = lib.mapAttrs (_name: _cfg: {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  }) users;

  programs.zsh.enable = true;
}
