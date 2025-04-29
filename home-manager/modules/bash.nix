{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases =
      let
        flakeDir = "~/nix";
      in {
        rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
        hms = "home-manager switch --flake ${flakeDir}";
        gs = "git status";
      };
  };
}
