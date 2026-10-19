{ pkgs, ... }:

{
  networking.networkmanager.plugins = [ pkgs.networkmanager-strongswan ];
  environment.systemPackages = [ pkgs.networkmanagerapplet ];

  # charon-nm aborts if this file is missing; an empty one is enough
  environment.etc."strongswan.conf".text = "";

  # charon-nm reads CAs from /etc/ssl/certs but only the first cert of each
  # file, so the NixOS bundle is useless to it; expose the Let's Encrypt roots
  environment.etc."ssl/certs/ISRG_Root_X1.crt".source =
    "${pkgs.cacert.unbundled}/etc/ssl/certs/ISRG_Root_X1:8210cfb0d240e3594463e0bb63828b00.crt";
  environment.etc."ssl/certs/ISRG_Root_X2.crt".source =
    "${pkgs.cacert.unbundled}/etc/ssl/certs/ISRG_Root_X2:41d29dd172eaeea780c12c6ce92f8752.crt";
}
