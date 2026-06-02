{ pkgs, ... }:

let
  customTreesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
    bash
    lua
    nix
    markdown
    markdown_inline
  ]);
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
      { plugin = customTreesitter; }
    ];
  };

  xdg.configFile = {
    "nvim/init.lua".source = ./files/nvim/init.lua;
    "nvim/lua" = {
      source = ./files/nvim/lua;
      recursive = true;
    };
  };
}
