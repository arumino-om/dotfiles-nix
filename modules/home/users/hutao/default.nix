{ pkgs, lib, ... }: {
  home.username = "hutao";
  home.stateVersion = "25.11";

  imports = [
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/neovim.nix
    ./programs/zsh.nix
  ];

  home.packages = with pkgs; [
    eza
    fd
    ghq
    git
    ripgrep
    fzf
    jq
    tree
    htop
    claude-code
    ffmpeg
  ];

  programs.gh.enable = true;

  programs.home-manager.enable = true;
}
