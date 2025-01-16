{ inputs, config, pkgs, ...}:

{
    # services.xserver.enable = true;
    stylix = {
        enable = true;
        autoEnable = true;
        image = ./current_wallpaper.jpg;
        # image = ./current_wallpaper.png;
        # targets.hyprland.enable = true;
    };
}