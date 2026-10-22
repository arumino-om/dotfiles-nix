{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    taps = [
      {
        name = "shaunsingh/sfmono-nerd-font-ligaturized";
        trusted = true;
      }
      {
        name = "tsung-ju/iguanatexmac";
        trusted = true;
      }
    ];

    brews = [
      # pinentry-mac は nix (services.gpg-agent.pinentry.package) で管理する
      "ghostscript"
    ];

    casks = [
      # General tools
      "atok"
      "1password"
      "1password-cli"
      "iguanatexmac"
      "visual-studio-code"
      "adobe-acrobat-reader"
      "morisawa-desktop-manager"
      "claude"
      "zotero"
      "raycast"

      # Developer tools
      "termius"
      "ghostty"
      "wireshark-app"
      "imhex"

      # Fonts
      "font-sf-mono-nerd-font-ligaturized"
    ];
  };
}
