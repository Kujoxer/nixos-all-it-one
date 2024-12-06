{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
        editor = "nvim";
      };
      user = {
        name = "kujoxer";
        email = "its.kujoxer.based@gmail.com";
      };
    };
  };
}
