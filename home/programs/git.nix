{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Arumino";
      user.email = "git@arumino-om.net";

      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };

  };
}
