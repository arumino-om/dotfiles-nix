# masato 固有の home-manager 設定
{ pkgs, pkgs-stable, ... }: {
  home.username = "masato";

  home.packages = with pkgs; [
    rsync
    git-credential-manager
    powershell
    # unstable の Python 3.14 では pyqt5 (asymptote 依存) がビルドできないため、
    # texlive は stable (Python 3.13 系) でビルドする。zsh と同じ回避パターン。
    (pkgs-stable.texlive.combine {
      inherit (pkgs-stable.texlive)
        scheme-medium
        collection-langjapanese
        latexmk;
    })
  ];
}
