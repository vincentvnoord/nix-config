{ inputs, pkgs, ... }:
{
  imports = [
    inputs.stylix.homeModules.stylix
    ./colors.nix
  ];

  home.packages = with pkgs; [
    noto-fonts-color-emoji
  ];

  stylix = {
    targets = {
      firefox.enable = true;
      kitty.enable = true;
      alacritty.enable = true;
      tmux.enable = false;
      gnome.enable = false;

      waybar.enable = false;
      hyprland.enable = false;

      gtk.enable = true;
    };

    enable = true;
    image = ./wallpapers/wallpaper.jpg; # change to your actual wallpaper path

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    fonts = {
      monospace = {
        name = "FiraCode Nerd Font Mono";
        package = pkgs.nerd-fonts.fira-code;
      };
      sansSerif = {
        # Geist — NothingOS 5.0's system default sans, replacing Inter.
        name = "Geist";
        package = pkgs.geist-font;
      };
      serif = {
        # Use DejaVu Serif instead of Georgia
        name = "DejaVu Serif";
        package = pkgs.dejavu_fonts;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
    };

    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
