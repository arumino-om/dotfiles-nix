# macOS 上のユーザー共通 home-manager 設定
{ lib, ... }: {
  programs.zsh = {
    shellAliases = {
      dsw = "sudo darwin-rebuild switch --flake ~/dev/github.com/arumino-om/dotfiles-nix";
    };

    initContent = lib.mkBefore ''
      if [[ $(uname -m) == 'arm64' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    '';
  };
}
