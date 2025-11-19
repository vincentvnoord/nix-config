{ pkgs, user, ... }: {
  programs.zsh.enable = true;
  programs.zsh.loginShell = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.${user} = {
      isNormalUser = true;
      description = "Vincent van Noord";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
