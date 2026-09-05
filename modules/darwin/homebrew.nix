{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;

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

      # Writing tools
      "zotero"
    ];
  };
}
