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
      # "mactex"

      # Developer tools
      "imhex"
      "termius"
      "ghostty"

      # Network
      "cloudflare-warp"

      # Fonts
      "font-sf-mono-nerd-font-ligaturized"
    ];
  };
}
