# masato 固有の home-manager 設定
{ pkgs, pkgs-stable, ... }: {
  home.username = "masato";

  home.packages = with pkgs; [
    rsync
    git-credential-manager
    powershell
    (pkgs-stable.texlive.combine {
      inherit (pkgs-stable.texlive)
        scheme-medium
        collection-langjapanese
        latexmk;
    })
  ];
}
