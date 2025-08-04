{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, C, killactive,"
      "$mainMod, Q, exec, $terminal"
      "$mainMod, B, exec, zen"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo,"
      "$mainMod, J, togglesplit,"
      "$mainMod, F, fullscreen"

      # Move focus with mainMod + arrow keys
      "$mainMod, a, movefocus, l"
      "$mainMod, d, movefocus, r"
      "$mainMod, w, movefocus, u"
      "$mainMod, s, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Example special workspace (scratchpad)
      #"$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizeactive"

      # Music player
      "$mainMod, o, exec, playerctl play-pause"
      "$mainMod, BRACKETRIGHT, exec, playerctl next"
      "$mainMod, BRACKETLEFT, exec, playerctl previous"

      # Resize bindings
      "$mainMod SHIFT, H, resizeactive, -20 0" # Resize left
      "$mainMod SHIFT, L, resizeactive, 20 0" # Resize right
      "$mainMod SHIFT, K, resizeactive, 0 -20" # Resize up
      "$mainMod SHIFT, J, resizeactive, 0 20" # Resize down

      # Screenshotting selection
      "$mainMod, S, exec, grim -g \"\$(slurp)\" - | wl-copy --type image/png"
    ];
  };
}
