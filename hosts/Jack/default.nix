# Jack 固有の設定 (NixOS / x86_64 デスクトップ)
{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos";

  environment.systemPackages = with pkgs; [
    kitty
    ghostty
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
