{ pkgs, ... }: {
  home.username = "masato";
  home.homeDirectory = "/Users/masato";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    bat
    eza
    fd
    ripgrep
    fzf
    jq
    tree
  ];

  programs.git = {
    enable = true;
    userName = "Arumino";
    userEmail = "git@arumino-om.net";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -la --icons";
      ls = "eza --icons";
      cat = "bat";
      dsw = "darwin-rebuild switch --flake ~/dev/github.com/arumino-om/dotfiles-nix";
    };
  };

  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.direnv.enable = true;

  programs.home-manager.enable = true;
}
