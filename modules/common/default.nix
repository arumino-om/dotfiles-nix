# ========================================
#   Common Configuration (Darwin / NixOS)
# ========================================
# 全ホスト・全OSで共通のシステム設定
{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Tokyo";

  environment.systemPackages = with pkgs; [
    git
    vim
    gnupg
  ];
}
