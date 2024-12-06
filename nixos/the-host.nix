{ config, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "America/Toronto";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8"
    ];
  };


  services.power-profiles-daemon.enable = false;
  services.libinput.enable = true;
  services.tlp.enable = true;
}

