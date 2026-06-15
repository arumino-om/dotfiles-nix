{ pkgs, lib, ... }: {
  xdg.userDirs.enable = true;
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.addons = [ pkgs.ibus-mozc ];
  };

}
