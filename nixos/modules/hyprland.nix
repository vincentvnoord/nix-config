{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # hyprlock has its own native fprintd client (auth.fingerprint in hyprlock.conf);
  # keep PAM's fprintd module off here so the two don't race to claim the sensor.
  security.pam.services.hyprlock = { fprintAuth = false; };
}
