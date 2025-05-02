{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.packages = with pkgs; [
    noto-fonts-emoji
  ];

  stylix = {
    targets = {
      firefox.enable = true;
      waybar.enable = false;
      hyprland.enable = false;
    };

    enable = true;
    image = ./wallpapers/fuji.jpg; # change to your actual wallpaper path

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";

    fonts = {
      monospace = {
        name = "FiraCode Nerd Font";
        package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
      };
      sansSerif = {
        name = "Inter";
        package = pkgs.inter;
      };
      serif = {
        # Use DejaVu Serif instead of Georgia
        name = "DejaVu Serif";
        package = pkgs.dejavu_fonts;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
    };

    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
