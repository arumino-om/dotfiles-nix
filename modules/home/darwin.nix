# macOS 上のユーザー共通 home-manager 設定
{ config, lib, pkgs, ... }: {
  programs.zsh = {
    shellAliases = {
      dsw = "sudo darwin-rebuild switch --flake ~/dev/github.com/arumino-om/dotfiles-nix";
    };

    initContent = lib.mkBefore ''
      if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        path=(''${path:#/opt/homebrew/(bin|sbin)} /opt/homebrew/bin /opt/homebrew/sbin)
      fi
    '';
  };

  services.gpg-agent.pinentry.package = pkgs.pinentry_mac;

  # home-manager が生成する gpg-agent の launchd サービスは `gpg-agent --supervised` で
  # 起動するが、これは systemd の socket activation 専用モードで、launchd は
  # LISTEN_FDS/LISTEN_FDNAMES を渡さないため
  #   Fatal: file descriptor 3 must be valid in --supervised mode
  # で即死する。KeepAlive と組み合わさって 10 秒ごとの起動失敗ループになるだけなので
  # 無効化する。agent は zsh 起動時の gpg-connect-agent が自動起動するものを使う
  # (端末は Aqua セッションに属するので pinentry-mac が GUI を出せる)。
  launchd.agents.gpg-agent.enable = lib.mkForce false;

  # 上記のとおり agent は launchd 管理外なので、世代を切り替えても再起動されない。
  # pinentry-mac の nix store パスは rebuild のたびに変わるため、実行中の agent が
  # 古いパスを掴んだままだと `gpg: signing failed: No pinentry` になる。
  # 世代切替後に設定を再読込させ、新しい pinentry のパスに追従させる。
  # (Linux 側で home-manager 自身が行う reloadSystemd の darwin 版に相当する)
  home.activation.reloadGpgAgent =
    lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      if ${lib.getExe' config.programs.gpg.package "gpg-connect-agent"} \
           --no-autostart /bye >/dev/null 2>&1; then
        run ${lib.getExe' config.programs.gpg.package "gpgconf"} --reload gpg-agent
      fi
    '';
}
