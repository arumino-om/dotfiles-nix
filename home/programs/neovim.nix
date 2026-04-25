{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/LazyVim/starter";
      rev = "803bc181d7c0d6d5eeba9274d9be49b287294d99";
    };
    recursive = true;
  };
}
