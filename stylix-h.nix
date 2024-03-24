{ inputs, config, pkgs, ...}:

{
    stylix = {
        # jaskjf
        image = ./Firefox_wallpaper.jpg;
        targets.hyprland.enable = true;
        targets.waybar.enable = true;
        polarity = "dark";
        # override = {
        #     base00 = "00a09b";
        #     base01 = "a03b00";
        #     base02 = "a07d00";
        #     base03 = "5300a0";
        #     base04 = "a00050";
        #     base05 = "00a050";
        #     base06 = "00a09b";
        #     base07 = "0058a0";
        #     base08 = "0025a0";
        #     base09 = "5300a0";
        #     base0A = "7b00a0";
        #     base0B = "a0009b";
        #     base0C = "a00073";
        #     base0D = "a00050";
        #     base0E = "689fcc";
        #     base0F = "192229";
        # };
    };
}