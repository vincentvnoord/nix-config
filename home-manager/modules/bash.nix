{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases =
      let
        flakeDir = "~/nix-config";
      in {
        rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
        hms = "home-manager switch --flake ${flakeDir} -b backup";
        gs = "git status";
      };
  };
}
