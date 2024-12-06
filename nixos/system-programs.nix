{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. 
  # To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    ntfs3g
    zip
    unzip
    curl
    wget
    neofetch
    wl-clipboard
    glib
    glibc
    glibcLocales
    glibcLocalesUtf8
  ];
}
