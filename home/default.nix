{ pkgs, lib, ... }: {
  home.username = "masato";
  home.stateVersion = "25.11";

  imports = [
    ./programs/git.nix
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/neovim.nix
  ];

  home.packages = with pkgs; [
    bat
    eza
    fd
    ripgrep
    fzf
    jq
    tree
  ];

  programs.bat.enable = true;
  programs.fzf.enable = true;

  programs.home-manager.enable = true;
}
