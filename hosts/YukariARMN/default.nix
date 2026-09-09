# YukariARMN 固有の設定 (macOS / aarch64)
{ pkgs, ... }: {
  homebrew.casks = [ 
    "keycastr"
    "anki"
    "gimp"

    # Browser
    "google-chrome"

    # IDE
    "clion"
    "rider"
    "phpstorm"
  ];

  homebrew.brews = [
    "vlmcsd"
  ];

  environment.systemPackages = with pkgs; [
    nodejs
    python313
    uv
  ];
}
