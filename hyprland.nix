{inputs,config, pkgs, ... }: 
{
    wayland.windowManager.hyprland = {
        # Whether to enable Hyprland wayland compositor
        enable = true;
        # The hyprland package to use
        package = pkgs.hyprland;
        # Whether to enable XWayland
        xwayland.enable = true;

        # Optional
        # Whether to enable hyprland-session.target on hyprland startup
        systemd.enable = true;

        extraConfig = ''bind=ALT,R,submap,resize
        submap=resize
        binde=,right,resizeactive,10 0
        binde=,left,resizeactive,-10 0
        binde=,up,resizeactive,0 -10
        binde=,down,resizeactive,0 10
        bind=,escape,submap,reset 
        submap=reset'';

        settings = {
            # Variables
            "$mainMod" = "SUPER";
            "$terminal" = "kitty";
            "$fileManagerCLI" = "kitty -e ranger";
            "$fileManagerGUI" = "dolphin";
            "$menu" = "wofi --show drun";
            "monitor" = "eDP-1,2256x1504,auto,1.0";

            env = [
                "XCURSOR_SIZE,24"
                "QT_QPA_PLATFORM,wayland"
                "QT_QPA_PLATFORMTHEME,qt5ct"
            ];

            windowrulev2 = "suppressevent maximize, class:.*"; # You'll probably like this.

            "exec-once" = "firefox & hyprpaper & dunst & wl-paste --watch cliphist store & for i in {1..4}; do wayneko --layer overlay --follow-pointer true & sleep 1; done";

            # Some more settings
            input = {
                kb_layout = "us";
                # kb_variant = "symbolic";
                # kb_model =
                # kb_options =
                # kb_rules =

                follow_mouse = "1";

                touchpad = {
                    natural_scroll = "yes";
                    disable_while_typing = "no";
                };

                sensitivity = "0"; # -1.0 - 1.0, 0 means no modification.
            };

            general = {
                # See https://wiki.hyprland.org/Configuring/Variables/ for more

                gaps_in = "5";
                gaps_out = "20";
                border_size = "2";
                #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                #"col.inactive_border" = "rgba(595959aa)";

                layout = "dwindle";

                # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
                allow_tearing = "false";
            };

            decoration = {
                # See https://wiki.hyprland.org/Configuring/Variables/ for more

                rounding = "10";
                
                blur = {
                    enabled = "true";
                    size = "3";
                    passes = "1";
                };

                drop_shadow = "yes";
                shadow_range = "4";
                shadow_render_power = "3";
                # "col.shadow" = "rgba(1a1a1aee)";
            };

            animations = {
                enabled = "yes";

                # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default"
                ];
            };

            dwindle = {
                # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
                pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = "yes"; # you probably want this
            };

            master = {
                # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
                new_status = "master";
            };

            gestures = {
                # See https://wiki.hyprland.org/Configuring/Variables/ for more
                workspace_swipe = "off";
            };

            misc = {
                # See https://wiki.hyprland.org/Configuring/Variables/ for more
                force_default_wallpaper = "-1"; # Set to 0 to disable the anime mascot wallpapers
            };

            # Example per-device config
            # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
            # device:epic-mouse-v1 {
                # sensitivity = -0.5
            # }

            # Keybinds
            bind = [
                # base default stuff
                "$mainMod, Q, exec, $terminal"
                "$mainMod, C, killactive, "
                "$mainMod, M, exit, "
                "$mainMod, E, exec, $fileManagerCLI"
                "$mainMod SHIFT, E, exec, $fileManagerGUI"
                "$mainMod, V, togglefloating, "
                "$mainMod, R, exec, $menu"
                "$mainMod, K, pseudo, # dwindle"
                "$mainMod, J, togglesplit, # dwindle"

                # screencap
                ", Print, exec, grimblast copy area"

                #lots more stuff aaarg
                "$mainMod SHIFT,Q,exec,firefox"
                "ALT SHIFT, Q, exec, firefox --private-window"
                "$mainMod, G, exec, google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland --incognito"

                


                "$mainMod SHIFT,C,exec,codium"
                "ALT SHIFT,S,exec,steam"
                "ALT SHIFT,D,exec,discord"
                "$mainMod,N,exec,nautilus"
                "$mainMod SHIFT,M,layoutmsg,cyclenext"
                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"
                "$mainMod, 0, workspace, 10"
                "$mainMod CTRL SHIFT, 1, movetoworkspace, 1"
                "$mainMod CTRL SHIFT, 2, movetoworkspace, 2"
                "$mainMod CTRL SHIFT, 3, movetoworkspace, 3"
                "$mainMod CTRL SHIFT, 4, movetoworkspace, 4"
                "$mainMod CTRL SHIFT, 5, movetoworkspace, 5"
                "$mainMod CTRL SHIFT, 6, movetoworkspace, 6"
                "$mainMod CTRL SHIFT, 7, movetoworkspace, 7"
                "$mainMod CTRL SHIFT, 8, movetoworkspace, 8"
                "$mainMod CTRL SHIFT, 9, movetoworkspace, 9"
                "$mainMod CTRL SHIFT, 0, movetoworkspace, 10"
                "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
                "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
                "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
                "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
                "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
                "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
                "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
                "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
                "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
                "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
                "$mainMod, A, togglespecialworkspace, specce1"
                "ALT SHIFT, 1, movetoworkspace, special:specce1"
                "$mainMod, S, togglespecialworkspace, specce2"
                "ALT SHIFT, 2, movetoworkspace, special:specce2"
                "$mainMod, D, togglespecialworkspace, specce3"
                "ALT SHIFT, 3, movetoworkspace, special:specce3"

                
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"

                # restart hyprpaper & waybar 
                "$mainMod SHIFT, B, exec, killall hyprpaper && hyprpaper"
                "$mainMod, B, exec, killall .waybar-wrapped && waybar"
                "$mainMod SHIFT, N, exec, wayneko --layer overlay --follow-pointer true"

                # bluetooth
                "$ALT SHIFT, Z, exec, bluetoothctl power on"
                "$ALT SHIFT, X, exec, bluetoothctl power off"
                "$mainMod SHIFT, Z, exec, bluetoothctl connect 74:5C:4B:B4:F2:07"

                # cliphist
                "$mainMod SHIFT, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
            ];
            # Repeat Keybinds
            binde = [
                # volume
                ", 123, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 6%+"
                ", 122, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 6%-"
                # brightness
                ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
                ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
            ];
            # mouse keybinds
            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];

        };


  };
}









