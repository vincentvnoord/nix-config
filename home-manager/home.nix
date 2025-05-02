{ config, pkgs, hostname, ... }: {
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

  imports = [
    (import ./modules { inherit config pkgs hostname; })
    (import ./home-packages.nix { inherit pkgs; })
  ];
}
