# macOS 上のユーザー共通 home-manager 設定
{ lib, ... }: {
  programs.zsh = {
    shellAliases = {
      dsw = "sudo darwin-rebuild switch --flake ~/dev/github.com/arumino-om/dotfiles-nix";
    };

    initContent = lib.mkBefore ''
      if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"

        # brew shellenv は PATH の先頭に /opt/homebrew を挿すため、
        # Homebrew と重複するコマンド (gnupg 一式・node など) が Nix 版より
        # 優先されてしまう。Homebrew を末尾へ回して Nix 側を優先させる。
        path=(''${path:#/opt/homebrew/(bin|sbin)} /opt/homebrew/bin /opt/homebrew/sbin)
      fi
    '';
  };
}
