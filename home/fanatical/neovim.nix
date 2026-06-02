{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = true;
  };

  xdg.configFile = {
    "nvim/init.lua".source = ./files/nvim/init.lua;
    "nvim/lua" = {
      source = ./files/nvim/lua;
      recursive = true;
    };
  };
}
