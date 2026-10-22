# macOS 上のユーザー共通 home-manager 設定
{ config, lib, pkgs, ... }: {
  programs.zsh = {
    initContent = lib.mkBefore ''
      if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        path=(''${path:#/opt/homebrew/(bin|sbin)} /opt/homebrew/bin /opt/homebrew/sbin)
      fi
    '';
  };

  # gpg-agentがmacOSでちゃんと動くようにする
  services.gpg-agent.pinentry.package = pkgs.pinentry_mac;
  launchd.agents.gpg-agent.enable = lib.mkForce false;
  home.activation.reloadGpgAgent =
    lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      if ${lib.getExe' config.programs.gpg.package "gpg-connect-agent"} \
           --no-autostart /bye >/dev/null 2>&1; then
        run ${lib.getExe' config.programs.gpg.package "gpgconf"} --reload gpg-agent
      fi
    '';
}
