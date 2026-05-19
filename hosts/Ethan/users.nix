{ config, pkgs, ... }:
{
  users.users.masato = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
  
  programs.zsh.enable = true;
}
