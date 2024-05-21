{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jonah";
  home.homeDirectory = "/home/jonah";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  imports =
    [
      ./bash.nix
      ./hyprland.nix
      ./waybar.nix
      ./stylix-h.nix
    ];

  # Minimize/Maximize Windows
  dconf.settings."org/gnome/desktop/wm/preferences".button-layout = "minimize,maximize,close";


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [


    #the good stuff
    vscodium-fhs
    vlc
    jdk
    clamav
    discord
    betterdiscordctl
    google-chrome
    gcc_multi
    gimp
    tlp
    wineWowPackages.waylandFull
    winetricks
    protontricks
    protonup
    kitty
    nyancat
    r2modman
    tor-browser
    gparted
    libreoffice

    networkmanager
    mpd
    killall
    # lm_sensors

    hyprland
    xorg.xhost
    font-awesome_5
    qt5ct
    qt6ct

    grimblast 
    brightnessctl
    brillo
    cliphist
    wl-clipboard
    go
    dunst
    libnotify

    imv
    gwenview
    # gnome extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.system-monitor-2
    gnomeExtensions.arcmenu
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.vitals
    gnomeExtensions.appindicator


    gnome.gnome-tweaks
    gnome.gnome-boxes
    gnome.gnome-software
    gnome.gnome-shell
    gnome.gnome-shell-extensions
    gnome-extension-manager

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jonah/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "codium";
    NIXPKGS_ALLOW_UNFREE=1;
  };

  programs.kitty = {
    enable = true;
    # theme = "Chalkboard";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
    ];
  };

  programs.thefuck = {
    enable = true;
    # alias = "fuck";
  };


  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "qt6ct";
  };


  # Fix this all later
  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   plugins = [
  #     inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
  #     # ...
  #   ];
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  }
