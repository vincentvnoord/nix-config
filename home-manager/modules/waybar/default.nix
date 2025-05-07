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
          "tray"
          "pulseaudio"
        ];

        clock = {
          format = "{:%d/%m/%Y - %H:%M}";
          icon = "🕒";
          icon-font = "JetBrainsMono Nerd Font";
          text-font = "Inter";
        };

        pulseaudio = {
          format = " {volume}%";
          format-muted = "{icon} Muted";
          icon = "";
          max-volume = 100;
          icon-font = "JetBrainsMono Nerd Font";
          text-font = "Inter";
        };
      }
    ];

    style = ./styles.css;
  };
}
