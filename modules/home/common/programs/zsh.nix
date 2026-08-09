{ lib, pkgs-stable, ... }: {
  programs.zsh = {
    enable = true;
    package = pkgs-stable.zsh; # unstable版zshはコマンド置換でハングするバグがあるため、stable版を使う
    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -la";
      ls = "eza";
      cat = "bat";
    };

    initContent = lib.mkBefore ''
      autoload -Uz compinit
      if [[ -f ''${ZDOTDIR:-$HOME}/.zcompdump ]]; then
        compinit -C
      else
        compinit
      fi
    '';
  };
}
