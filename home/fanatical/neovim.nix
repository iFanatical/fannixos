{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
        p.lua
        p.bash
        p.nix
        p.markdown
        p.markdown-inline
      ]))
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
