# Ethan 固有の設定 (NixOS / aarch64 VM)
{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/desktop/gnome.nix
  ];

  system.stateVersion = "26.05";

  networking.hostName = "Ethan-Winters";

  environment.systemPackages = with pkgs; [
    ghostty
  ];
}
