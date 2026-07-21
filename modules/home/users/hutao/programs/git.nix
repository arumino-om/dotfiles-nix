{ pkgs, ... }: {
  programs.git = {
    enable = true;

    settings = {
      user.name = "Arumino";
      user.email = "git@arumino-om.net";

      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        credential.helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        credential.credentialStore = "secretservice";
      };
      ghq.root = "~/dev";
    };
  };
}
