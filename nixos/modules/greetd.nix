{ pkgs, user, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = {
        command = "${pkgs.greetd}/bin/agreety --cmd '${pkgs.uwsm}/bin/uwsm start -- start-hyprland'";
      };
      initial_session = {
        command = "${pkgs.uwsm}/bin/uwsm start -- start-hyprland";
        inherit user;
      };
    };
  };
}
