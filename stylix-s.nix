{ inputs, config, pkgs, ...}:

{
    # services.xserver.enable = true;
    stylix = {
        image = ./Firefox_wallpaper.jpg;
        # image = ./Firefox_wallpaper.png;
        # targets.hyprland.enable = true;
    };
}