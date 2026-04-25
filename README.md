# dotfiles (nix)

## 環境
- macOS (nix-darwin)
- Linux (対応予定)

## 構成
```
- flake.nix      - エントリーポイント
- darwin/        - macOS固有の設定
- home/          - home-manager共通設定
  - programs/    - 各ツールの設定
```

## セットアップ
### macOS
```bash
# Nixのインストール
$ sh <(curl -L https://nixos.org/nix/install)

# nix-darwinのインストール
$ sudo nix run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch

# リビルド
$ dsw
```

## 主なツール
- zsh + starship
- neovim (with LazyVim)
- git
