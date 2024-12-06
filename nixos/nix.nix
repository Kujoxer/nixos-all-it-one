{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowInsecurePackages = true;

  nix.extraOptions = ''
    extra-experimental-features = nix-command
    extra-experimental-features = flakes
    '';
}
