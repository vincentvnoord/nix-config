{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = let flakeDir = "~/nix-config";
    in {
      rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
      gs = "git status";
    };
  };
}
