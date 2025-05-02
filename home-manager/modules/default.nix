{ config, pkgs, hostname, inputs, ... }: {
  imports = [
    (import ./waybar { inherit config pkgs hostname; })
    (import ./hyprland { inherit config pkgs hostname; })
    ./bash.nix
    (import ./zsh.nix { inherit config pkgs hostname; })
    (import ./stylix { inherit config pkgs inputs; })
  ];
}
