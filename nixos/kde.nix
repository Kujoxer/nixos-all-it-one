{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set 
  # a password with ‘passwd’.
  users.users.hitch = {
    isNormalUser = true; 
    description = "hitch";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [
      wl-clipboard
      obsidian
      kitty
    ];
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    #plasma-browser-integration
    #oxygen
    plasma-welcome
    kate
    konsole
  ];

  # Enable the X11 windowing system. You can 
  # disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:caps_toggle";
  };


  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true; 
  services.desktopManager.plasma6.enable = true;
  services.printing.enable = false;
}
