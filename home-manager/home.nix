{
  inputs,
  config,
  pkgs,
  hostname,
  ...
}:
{
  home = {
    username = "vincent";
    homeDirectory = "/home/vincent";
    stateVersion = "24.11";
  };

  imports = [
    (import ./modules {
      inherit
        config
        pkgs
        hostname
        inputs
        ;
    })
    (import ./home-packages.nix { inherit pkgs; })
  ];
}
