{config, pkgs, ...}:

{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                output = [
                    "eDP-1"
                    "HDMI-A-1"
                ];
                modules-left = [ "hyprland/workspaces" "sway/mode" "wlr/taskbar" "sway/scratchpad" "hyprland/scratchpad" ];
                modules-center = [ "sway/window" "hyprland/window" ];
                modules-right = [ "mpd" "pulseaudio" "cpu" "memory" "temperature" "backlight" "keyboard-state" "sway/language" "battery" "clock" "tray" ];

                "hyprland/workspaces" = {
                    disable-scroll = true;
                    all-outputs = true;
                };
                "custom/hello-from-waybar" = {
                    format = "hello {}";
                    max-length = 40;
                    interval = "once";
                    exec = pkgs.writeShellScript "hello-from-waybar" ''
                        echo "from within waybar"
                    '';
                };
                "clock" = {
                    # timezone = "America/New_York";
                    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                    format-alt = "{:%Y-%m-%d}";
                };
            };
        };
    };
  
}