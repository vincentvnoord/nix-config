{
  config,
  pkgs,
  user,
  hostname,
  stateVersion,
  inputs,
  ...
}:
{
  home-manager.users.${user} = {
    home.stateVersion = stateVersion;

    # Import your home.nix configuration and pass hostname
    imports = [
      (import ../../home-manager/home.nix {
        inherit
          config
          pkgs
          hostname
          inputs
          ;
      })
    ];
  };
}
