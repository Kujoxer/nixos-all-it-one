{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./vm.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:caps_toggle";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hitch = {
    isNormalUser = true;
    description = "hitch";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [
      telegram-desktop
      chromium
      nekoray
      obsidian
      xfce.mousepad
    ];
  };

  nix.enable = true;
  # Allow unfree packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      experimental-features = "nix-command flakes";
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    tlp
    wget
    curl
    zip
    unzip
    yazi
    ranger
    tmux
    w3m
    git
    udisks2
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  programs.firefox.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.tlp.enable = true;

  programs = { 
    # enable sway window manager
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      xwayland.enable = true;
      extraSessionCommands = ''
          # SDL:
          export SDL_VIDEODRIVER=wayland
          # QT (needs qt5.qtwayland in systemPackages):
          export QT_QPA_PLATFORM=wayland-egl
          export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
          # Fix for some Java AWT applications (e.g. Android Studio),
          # use this if they aren't displayed properly:
          export _JAVA_AWT_WM_NONREPARENTING=1
	  export EDITOR=nvim
        '';
      extraPackages = with pkgs; [
        wl-clipboard
        i3status
        brightnessctl
        swayidle
	dmenu
        wmenu
        mako # notification system developed by swaywm maintainer
        grim
        slurp # screenshot functionality
        kitty
      ];
    };
  };


  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Noto Sans" "Source Han Sans" ];
    };
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Включаем автоподключение для устройств
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;
  system.stateVersion = "24.11";

}
