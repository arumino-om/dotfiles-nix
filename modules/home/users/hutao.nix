# hutao 固有の home-manager 設定
{ pkgs, ... }: {
  home.username = "hutao";

  programs.git.settings.extraConfig = {
    credential.helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
    credential.credentialStore = "secretservice";
  };
}
