{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "none";
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
