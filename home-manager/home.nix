{
  inputs,
  config,
  pkgs,
  hostname,
  stateVersion,
  pkgs-unstable,
  ...
}:
{
  home = {
    username = "vincent";
    homeDirectory = "/home/vincent";
    stateVersion = stateVersion;
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
    (import ./home-packages.nix { 
      inherit 
      pkgs
      inputs
      pkgs-unstable
      ; 
    })
  ];
}
