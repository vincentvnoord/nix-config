{
  config,
  pkgs,
  hostname,
  ...
}:
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        output =
          if hostname == "desktop" then
            [ "DP-1" ]
          else if hostname == "laptop" then
            [ "eDP-1" ]
          else
            [ ];

        layer = "top"; # Ensure Waybar is on top
        position = "top"; # Place at top of screen
        height = 30; # Visible height
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "battery"
          "network"
          "pulseaudio"
        ];
      }
    ];

    style = ./styles.css;
  };
}
