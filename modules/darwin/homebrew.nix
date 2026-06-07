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
    ];

    casks = [
      # General tools
      "atok"
      "bitwarden"
      "iguanatexmac"
      "visual-studio-code"

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
