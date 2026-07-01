{ config, pkgs, ... }: {
  imports = [
    ../../modules/darwin
    ../../modules/darwin/homebrew.nix
  ];

  # YukariARMN 固有の設定
  homebrew.casks = [
    "imhex"
    "keycastr"
    "wireshark-app"
    "anki"

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
