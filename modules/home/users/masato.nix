# masato 固有の home-manager 設定
{ pkgs, ... }: {
  home.username = "masato";

  home.packages = with pkgs; [
    rsync
    git-credential-manager
    powershell
    (texlive.combine {
      inherit (texlive)
        scheme-medium
        collection-langjapanese
        latexmk;
    })
  ];
}
