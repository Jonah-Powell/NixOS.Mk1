{ inputs, config, pkgs, ...}:

{
    stylix = {
        image = ./Firefox_wallpaper.jpg;
        # image = ./Firefox_wallpaper.png;
        targets.hyprland.enable = true;
        targets.waybar.enable = true;
        polarity = "dark";
        # override = {
        #     base00 = "203d21";
        #     base01 = "ff0018";
        #     base02 = "762200";
        #     base03 = "ff00e2";
        #     base04 = "244e04";
        #     base05 = "00ff29";
        #     base06 = "393d02";
        #     base07 = "f0ff1e";
        #     base08 = "636820";
        #     base09 = "08fe03";
        #     base0A = "38495b";
        #     base0B = "eeaa79";
        #     base0C = "ff5c02";
        #     base0D = "00ebff";
        #     # base0E = "";
        #     # base0F = "";
        # };
    };
}