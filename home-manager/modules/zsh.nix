{ config, pkgs, hostname, ... }: {
  programs.zsh = {
    enable = true;
    # Enable syntax highlighting
    syntaxHighlighting.enable = true;
    # Enable autosuggestions
    autosuggestion.enable = true;
    # Set custom Zsh prompt (optional)
    initExtra = ''
      export PROMPT='%n@%m:%~%# '
    '';

    shellAliases = let flakeDir = "~/nix-config";
    in {
      rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}#${hostname}";
      gs = "git status";
    };
  };
}
