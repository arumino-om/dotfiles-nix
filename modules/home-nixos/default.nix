{ pkgs, lib, ... }: {
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
