# ========================================
#        Common macOS Configuration
# ========================================
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    vim
    gnupg
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 6;
  system.primaryUser = "masato";

  system.defaults = {
    dock = {
      autohide = true;  #自動でdockを隠す
      show-recents = false; #最近使用したアプリを隠す
      tilesize = 58;  #タイルサイズ
    };

    finder = {
      AppleShowAllExtensions = true;  #Finderですべての拡張子を出す
      ShowPathbar = true; #パスバー
      FXEnableExtensionChangeWarning = false; #拡張子変更の警告を消す
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark"; #ダークモードにする
      NSStatusItemSpacing = 9;
      NSStatusItemSelectionPadding = 6;
    };

    trackpad = {
      Clicking = true;  #タップでクリック
    };

    loginwindow = {
      GuestEnabled = false;
    };
  };

  # compinit は home-manager 側で管理するため、nix-darwin 側では無効化
  programs.zsh.enableCompletion = false;

  # Touch ID で sudo 認証を可能にする
  security.pam.services.sudo_local.touchIdAuth = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
