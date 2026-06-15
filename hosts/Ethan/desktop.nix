{ config, pkgs, ... }:

{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = true;
      games.enable = false;
    };
  };

  environments.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];
}
