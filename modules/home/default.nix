{ pkgs, lib, ... }: {
  home.username = "masato";
  home.stateVersion = "25.11";

  imports = [
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/neovim.nix
    ./programs/zsh.nix
  ];

  home.packages = with pkgs; [
    bat
    eza
    fd
    ghq
    git
    ripgrep
    fzf
    jq
    tree
    htop
    rsync
    claude-code
    ffmpeg
    powershell
    (texlive.combine {
      inherit (texlive)
        scheme-medium
        collection-langjapanese
        latexmk;
    })
  ];

  programs.bat.enable = true;
  programs.fzf.enable = true;

  programs.home-manager.enable = true;
}
