#!/bin/sh

# line 29
# monitor=HDMI-A-1, 1920x1080@144, -5000x0, 1
# monitor=HDMI-A-1, 1920x1080@144, 1920x0, 1

firstCommand=$1
gaming="monitor=HDMI-A-1, 1920x1080@144, -5000x0, 1"
default="monitor=HDMI-A-1, 1920x1080@144, 1920x0, 1"

mainFlow() {
    if [[ -n "$firstCommand" ]]; then
        case $firstCommand in
        "help")
            echo "Hello fella! change the position of your main screen"
            echo "this is a list of possibles commands:"
            echo ""
            echo "help  -- print this message"
            echo "-g    -- will change the position of the screen to gaming setup"
            echo "-d    -- will change the position of the screen to default"
            ;;
        "-g")
            sed -i "29s/.*/$gaming/" /home/kuro/.config/hypr/hyprland.conf
            ;;
        "-d")
            sed -i "29s/.*/$default/" /home/kuro/.config/hypr/hyprland.conf
            ;;
        *)
            echo "Command not found!"
            ;;
        esac
    fi
}

mainFlow