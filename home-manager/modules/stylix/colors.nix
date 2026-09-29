{ config, lib, ... }:
let
  c = config.lib.stylix.colors;
  schemeName = "catppuccin-mocha";
  base16Names = [
    "base00" "base01" "base02" "base03" "base04" "base05" "base06" "base07"
    "base08" "base09" "base0A" "base0B" "base0C" "base0D" "base0E" "base0F"
  ];
in
{
  # Named palette file in the nix store — one file per scheme.
  # To add a new theme, generate another "<name>.json" here.
  # current.json (below) is the live pointer apps read from.
  home.file.".config/theme/colors/${schemeName}.json".text = builtins.toJSON {
    scheme = schemeName;
    colors = lib.genAttrs base16Names (name: "#${c.${name}}");
  };

  # Create current.json -> <schemeName>.json on first activation if it doesn't
  # exist yet. After that, a theme-switcher script owns it (ln -sf).
  home.activation.currentColorSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    colors_dir="$HOME/.config/theme/colors"
    if [ ! -e "$colors_dir/current.json" ] && [ ! -L "$colors_dir/current.json" ]; then
      ln -s "$colors_dir/${schemeName}.json" "$colors_dir/current.json"
    fi
  '';
}
