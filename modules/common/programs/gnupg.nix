{ lib, pkgs, ... }: {
  programs.gnupg = {
    agent.enable = true;
    agent.enableSSHSupport = false;
  }
}
