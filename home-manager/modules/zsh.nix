{
  config,
  pkgs,
  hostname,
  ...
}:
{
  programs.zsh = {
    enable = true;
    # Enable syntax highlighting
    syntaxHighlighting.enable = true;
    # Enable autosuggestions
    autosuggestion.enable = true;
    # Set custom Zsh prompt (optional)
    initContent = ''
      export PROMPT='%n@%m:%~%# '
      eval "$(tmuxifier init -)"
    '';

    shellAliases =
      let
        flakeDir = "~/nix-config";
      in
      {
        rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}#${hostname}";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gcm = "git commit -m";
        gco = "git checkout";
        gcb = "git checkout -b";
        gpl = "git pull";
        gpu = "git push";
        gf = "git fetch";
      };
  };
}
