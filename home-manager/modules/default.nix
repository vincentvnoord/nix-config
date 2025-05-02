{ config, pkgs, hostname, ... }: {
  imports = [
    (import ./waybar { inherit config pkgs hostname; })
    (import ./hyprland { inherit config pkgs hostname; })
    ./bash.nix
    (import ./zsh.nix { inherit config pkgs hostname; })
  ];
}
