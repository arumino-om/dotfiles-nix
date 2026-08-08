{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;

    taps = [
      {
        name = "shaunsingh/sfmono-nerd-font-ligaturized";
      }
      {
        name = "tsung-ju/iguanatexmac";
      }
    ];

    brews = [
      "pinentry-mac"
      "ghostscript"
      "bitwarden-cli"
    ];

    casks = [
      # General tools
      "atok"
      "bitwarden"
      "1password"
      "1password-cli"
      "iguanatexmac"
      "visual-studio-code"
      "stretchly"
      "adobe-acrobat-reader"
      "morisawa-desktop-manager"
      "claude"
      "qbittorrent"

      # Developer tools
      "termius"
      "ghostty"

      # Network
      "cloudflare-warp"

      # Fonts
      "font-sf-mono-nerd-font-ligaturized"
    ];
  };
}
