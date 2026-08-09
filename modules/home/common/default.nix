# ========================================
#      Common home-manager Configuration
# ========================================
# 全ユーザー共通の home-manager 設定
{ pkgs, ... }: {
  imports = [
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/neovim.nix
    ./programs/zsh.nix
    ./programs/gnupg.nix
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    eza
    fd
    ghq
    git
    ripgrep
    jq
    tree
    htop
    claude-code
    ffmpeg
  ];

  programs.gh.enable = true;
  programs.bat.enable = true;
  programs.fzf.enable = true;

  programs.home-manager.enable = true;
}
