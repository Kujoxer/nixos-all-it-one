{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts._0xproto
      noto-fonts-cjk-sans
      noto-fonts-emoji
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
    ];
    fontconfig.defaultFonts = {
      serif = [ "0xProto Nerd Font" "Source Han Serif" ];
      sansSerif = [ "0xProto Nerd Font Mono" "Source Han Sans" ];
    };
  };
}
