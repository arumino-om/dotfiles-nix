# NixOS 上のユーザー共通 home-manager 設定
{ ... }: {
  xdg.userDirs.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
    };
  };
}
