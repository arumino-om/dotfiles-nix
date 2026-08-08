# YukariARMN 固有の設定 (macOS / aarch64)
{ pkgs, ... }: {
  homebrew.casks = [
    "imhex"
    "keycastr"
    "wireshark-app"
    "anki"
    "gimp"

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
