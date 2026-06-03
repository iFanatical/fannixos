{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    };
    programs.nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
  users.defaultUserShell = pkgs.zsh;
}
