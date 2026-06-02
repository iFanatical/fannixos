{ ... }:

{
  xdg.configFile = {
    "nvim/init.lua".source = ./files/nvim/init.lua;
    "nvim/lua" = {
      source = ./files/nvim/lua;
      recursive = true;
    };
  };
}

