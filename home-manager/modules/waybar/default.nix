{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = [{
      output = [ "DP-1" ];
      layer = "top"; # Ensure Waybar is on top
      position = "top"; # Place at top of screen
      height = 30; # Visible height
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "battery" "network" "pulseaudio" ];
    }];

    style = ./styles.css;
  };
}
