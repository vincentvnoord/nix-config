{ config, lib, ... }:
let
  c = config.lib.stylix.colors;
  base16Names = [
    "base00" "base01" "base02" "base03" "base04" "base05" "base06" "base07"
    "base08" "base09" "base0A" "base0B" "base0C" "base0D" "base0E" "base0F"
  ];
in
{
  home.file = {
    ".config/hypr/colors.lua".text = ''
      Colors = {
      ${lib.concatMapStringsSep "\n" (name:
        ''  ${name} = "rgba(${c.${name}}ff)",''
      ) base16Names}
      }
    '';

    ".config/waybar/colors.css".text = ''
      ${lib.concatMapStringsSep "\n" (name:
        ''@define-color ${name} #${c.${name}};''
      ) base16Names}
    '';

    # General, machine-readable palette — the single source any JSON-capable
    # consumer reads (quickshell's Theme.qml today, scripts/other apps later).
    # waybar/hypr above are just format-specific renderings of the same base16
    # values, so nothing can drift. The colors/ dir lets you drop in alternate
    # named palettes and switch which one consumers point at.
    ".config/theme/colors/default.json".text = builtins.toJSON {
      scheme = "catppuccin-mocha";
      colors = lib.genAttrs base16Names (name: "#${c.${name}}");
    };
  };
}
