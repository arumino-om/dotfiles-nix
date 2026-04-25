{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -la --icons";
      ls = "eza --icons";
      cat = "bat";
      dsw = "sudo darwin-rebuild switch --flake ~/dev/github.com/arumino-om/dotfiles-nix";
    };
  };
}
