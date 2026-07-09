# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "";

  # Select internationalisation properties.
  i18n.defaultLocale = "";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "";
    LC_IDENTIFICATION = "";
    LC_MEASUREMENT = "";
    LC_MONETARY = "";
    LC_NAME = "";
    LC_NUMERIC = "";
    LC_PAPER = "";
    LC_TELEPHONE = "";
    LC_TIME = "";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."" = {
    isNormalUser = true;
    description = "";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install Flathub
  services.flatpak.enable = true;

  # Start tuned
  services.tuned.enable = true;

  # Install firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # Flatpak
    pkgs.flatpak

    # Curl
    pkgs.curl

    # WGet
    pkgs.wget

    # Codecs
    pkgs.ffmpeg

    # Virtualization
    pkgs.qemu
    pkgs.libvirt
    pkgs.bridge-utils
    pkgs.virt-manager

    # Archiving
    pkgs.zip
    pkgs.unzip
    pkgs.rar
    pkgs.unrar
    pkgs.gzip
    pkgs.bzip2
    pkgs.xz
    pkgs.minizip
    pkgs.arj
    pkgs.dpkg

    # Printers
    pkgs.cups
    pkgs.hplip

    # TLP
    #pkgs.tlp

    # Tuned
    pkgs.tuned

    # Firewall
    pkgs.firewalld
    pkgs.firewalld-gui

    # Timeshift
    pkgs.timeshift

    # PDF viewer

    # Chromium
    pkgs.chromium

    # Firefox
    pkgs.firefox

    # Krusader
    pkgs.krusader
    pkgs.krename
    pkgs.kdiff3
    pkgs.kdePackages.kompare

    # Thunderbird
    pkgs.thunderbird

    # k3b
    pkgs.kdePackages.k3b

    # Brasero
    pkgs.brasero

    # VLC
    pkgs.vlc

    # Tux Guitar
    pkgs.tuxguitar

    # Clam Anti Virus
    pkgs.clamav
    pkgs.clamtk

    # SciTE
    pkgs.scite

    # Notepad++

    # Sublime Text
    pkgs.sublime
    pkgs.sublime-merge

    # Libre Office
    pkgs.libreoffice

    # Only Office
    pkgs.onlyoffice-desktopeditors

    # AnyDesk
    #pkgs.anydesk

    # Remmina
    pkgs.remmina

    # Balena Etcher

    # Virtual Box
    pkgs.virtualbox

    # TeamViewer
    pkgs.teamviewer

    # Blender
    pkgs.blender

    # InkScape
    pkgs.inkscape

    # GIMP
    pkgs.gimp

    # WreShark
    pkgs.wireshark

    # Nord VPN
    #pkgs.nordvpn

    # Zoom

    # Bottles
    pkgs.bottles

    # Calibre
    pkgs.calibre

    ##########
    # Gaming
    ##########

    # Gaming Essentials
    pkgs.dbus
    pkgs.vulkan-tools
    pkgs.vulkan-utility-libraries
    pkgs.vkd3d
    pkgs.mangohud
    pkgs.goverlay
    pkgs.gamescope
    pkgs.gamemode
    pkgs.vkbasalt
    pkgs.protontricks
    pkgs.gum

    # Wine
    pkgs.wine
    pkgs.winetricks

    # DosBox
    pkgs.dosbox

    # Steam
    pkgs.steam

    # Heroic Games Launcher
    pkgs.heroic

    # Lutris
    pkgs.lutris

    ##########
    # Programing
    ##########

    # Build Essentials
    pkgs.openssl
    pkgs.libressl
    pkgs.openssh
    pkgs.samba
    pkgs.libyaml
    pkgs.libffi
    pkgs.readline
    pkgs.zlib
    pkgs.gdbm
    pkgs.ncurses
    pkgs.checkpolicy
    pkgs.policycoreutils
    pkgs.podman

    # Git
    pkgs.git

    # GitHub Desktop
    pkgs.github-desktop

    ##########
    # Programing Languages
    ##########

    # Perl
    pkgs.perl

    # Rust
    pkgs.rustup

    # C/C++
    pkgs.gcc
    pkgs.clang
    pkgs.libgcc
    pkgs.glibc
    pkgs.autoconf
    pkgs.automake
    pkgs.cmake

    # GTK+
    pkgs.gtk3
    pkgs.clutter
    pkgs.gobject-introspection

    # Python
    pkgs.python3

    # .Net
    pkgs.dotnet-sdk_10

    # Java
    pkgs.jdk
    pkgs.openjdk
    pkgs.maven
    pkgs.ant
    pkgs.apacheHttpd
    pkgs.gradle

    # PHP
    pkgs.php
    pkgs.phpunit
    pkgs.phpExtensions.mysqli
    pkgs.phpExtensions.ctype
    pkgs.phpExtensions.curl
    pkgs.phpExtensions.gmp
    pkgs.phpExtensions.ldap
    pkgs.phpExtensions.mbstring
    pkgs.phpExtensions.mysqlnd
    pkgs.phpExtensions.soap
    pkgs.phpExtensions.xml
    pkgs.phpExtensions.yaml

    # Deno
    pkgs.deno

    # Ruby
    pkgs.ruby
    pkgs.rubyPackages.irb
    pkgs.rubyPackages.rbs
    pkgs.rubyPackages.rake
    pkgs.rubyPackages.rexml

    # Node JS
    pkgs.nodejs

    # Yarn
    pkgs.yarn

    # Go
    pkgs.go

    ##########
    # IDEs
    ##########

    # Mono Develop
    pkgs.mono

    # Visual Studio Code
    pkgs.vscode

    # Code Blocks
    pkgs.codeblocks

    # JetBrains Toolbox
    pkgs.jetbrains-toolbox

    # Netbeans
    pkgs.netbeans

    # Eclipse
    pkgs.eclipses.eclipse-java
    pkgs.eclipses.eclipse-cpp
    pkgs.eclipses.eclipse-rcp
    pkgs.eclipses.eclipse-dsl
    pkgs.eclipses.eclipse-embedcpp
    pkgs.eclipses.eclipse-jee
    pkgs.eclipses.eclipse-committers

    ##########
    # Databases
    ##########

    # SQLite
    pkgs.sqlite

    # MariaDB
    pkgs.mariadb
    pkgs.mariadb-connector-java
    pkgs.mariadb-connector-c
    pkgs.libmysqlclient

    # MySql
    # Is MariaDB

    # PostgreSQL
    pkgs.postgresql
    pkgs.pgadmin4
    pkgs.pgadmin4-desktopmode

    # MongoDB
    pkgs.mongodb
    #pkgs.mongodb-tools
    #pkgs.mongodb-compass

    ##########
    # Tools
    ##########

    # Meld
    pkgs.meld

    # PuTTY
    pkgs.putty

    # Postman
    pkgs.postman

    # Docker
    pkgs.docker
    pkgs.docker-client
    pkgs.containerd

    # Composer
    pkgs.phpPackages.composer

    # Apache
    pkgs.apacheHttpd

    # Lamp
    # Is made out of Apache, MariaDB and PHP

    # Symphony
    # Is made out of LAMP and composer
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
