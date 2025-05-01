{ config, pkgs, ... }: {
  home = {
    username = "vincent";
    homeDirectory = "/home/vincent";
    stateVersion = "24.11";

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };

  imports = [ ./modules ./home-packages.nix ];

}
