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
    configure = {
      packages.myPlugins = {
        start = [ customTreesitter ];
      };
    };
  };
}
