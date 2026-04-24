# ========================================
#           macOS Configuration
# ========================================
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 6;
  system.primaryUser = "masato";

  system.defaults = {
    dock = {
      autohide = true;  #自動でdockを隠す
      show-recents = false; #最近使用したアプリを隠す
      tilesize = 68;  #タイルサイズ
    };

    finder = {
      AppleShowAllExtensions = true;  #Finderですべての拡張子を出す
      ShowPathbar = true; #パスバー
      FXEnableExtensionChangeWarning = false; #拡張子変更の警告を消す
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark"; #ダークモードにする
    };

    trackpad = {
      Clicking = true;  #タップでクリック
    };

    screencapture = { #スクショの場所とか
      location = "~/Pitures/";
      type = "png";
    };

    loginwindow = {
      GuestEnabled = false;
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
}
