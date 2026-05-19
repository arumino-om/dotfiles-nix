# dotfiles (nix)

## 環境
- macOS (nix-darwin)
- Linux (対応予定)

## ホスト一覧
- ARMN-HonYokoLab: 研究室Mac (nix-darwin, aarch64)
- YukariARMN: M5 MacBook Air (nix-darwin, aarch64)
- Jack: デスクトップPC (nixos, x86_64)
- Ethan: M5 MacBook Air 上で動いてる仮想環境 (nixos, aarch64)

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
nixファイルに書いてる
