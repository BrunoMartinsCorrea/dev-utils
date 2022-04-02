#!/bin/bash

function isInstalled() {
    if ! command -v "$1" &>/dev/null; then
        echo "0"
    else
        echo "1"
    fi
}

INTERFACE_THEME=1
INTERFACE_SOLID=0

while [ -n "$1" ]; do
    case "$1" in
    --help)
        echo "Usage: $(basename "$0") [OPTION..]

  --dark	Set dark theme as default.
  --solid	Set windows transparency false.
"
        exit 0
        ;;
    --dark)
        INTERFACE_THEME=0
        ;;
    --solid)
        INTERFACE_SOLID=1
        ;;
    *)
        echo "Ops! Try read the help! $(basename "$0") --help"
        exit 1
        ;;
    esac

    shift
done

sudo pacman -Syuq --needed --noconfirm --noprogressbar base-devel cmake git rustup

# RUSTUP
if [ "$(isInstalled rustup)" == 1 ]; then
    rustup install stable
    rustup default stable
fi
# RUSTUP

# PARU
if [ "$(isInstalled paru)" == 0 ]; then
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -si
fi
# PARU

# INSTALLING ESSENTIAL PACKAGES
paru -Syuq --needed --sudoloop --noconfirm --noprogressbar epiphany gedit gnome-terminal capitaine-cursors gnome-tweaks gnome-session-properties mojave-gtk-theme gnome-mojave-timed-wallpaper la-capitaine-icon-theme ruby-fusuma

# SETTING UP KEYBOARD
gsettings set org.gnome.desktop.peripherals.keyboard delay 500
gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true
gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state true
gsettings set org.gnome.desktop.peripherals.keyboard repeat true
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30

# SETTING UP TOUCHPAD GESTURES
gsettings set org.gnome.desktop.peripherals.touchpad click-methods "fingers"
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false
gsettings set org.gnome.desktop.peripherals.touchpad left-handed "mouse"
gsettings set org.gnome.desktop.peripherals.touchpad middle-click-emulation false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad send-events "enabled"
gsettings set org.gnome.desktop.peripherals.touchpad speed 0
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
sudo gpasswd -a "$USER" input
mkdir -p ~/.config/fusuma
echo "swipe:
  3:
    left:
      command: \"xdotool set_desktop --relative 1\"
    right:
      command: \"xdotool set_desktop --relative -- -1\"
    up:
      command: \"dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.toggle();'\"
    down:
      command: \"dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.toggle();'\"
pinch:
  3:
    in:
      command: \"dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.shellDBusService.ShowApplications();'\"
    out:
      command: \"xdotool key ctrl+d\"" >~/.config/fusuma/config.yml
echo "[Desktop Entry]
Type=Application
Exec=/usr/bin/fusuma -d
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Fusuma
Name=Fusuma
Comment[en_US]=
Comment=" >~/.config/autostart/fusuma.desktop
fusuma -d

# SETTING DEFAULT WEB BROWSER
xdg-settings set default-web-browser org.gnome.Epiphany.desktop

# TWEAKS - KEYBINDINGS
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "['<Alt>space']"
gsettings set org.gnome.desktop.wm.keybindings always-on-top "[]"
gsettings set org.gnome.desktop.wm.keybindings begin-move "['<Alt>F7']"
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['<Alt>F8']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings cycle-group "['<Alt>F6']"
gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward "['<Shift><Alt>F6']"
gsettings set org.gnome.desktop.wm.keybindings cycle-panels "['<Control><Alt>Escape']"
gsettings set org.gnome.desktop.wm.keybindings cycle-panels-backward "['<Control><Shift><Alt>Escape']"
gsettings set org.gnome.desktop.wm.keybindings lower "[]"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings maximize-horizontally "[]"
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically "[]"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-center "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-ne "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-nw "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-se "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-sw "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "['<Super><Shift>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Super><Shift>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Super><Shift>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "['<Super><Shift>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-e "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-n "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-s "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-side-w "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Control><Shift><Alt>exclam', '<Super><Shift>Home']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Control><Shift><Alt>parenright']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-11 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-12 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Control><Shift><Alt>at']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Control><Shift><Alt>numbersign']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Control><Shift><Alt>dollar']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Control><Shift><Alt>percent']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Control><Shift><Alt>dead_diaeresis']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Control><Shift><Alt>ampersand']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Control><Shift><Alt>asterisk']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Control><Shift><Alt>parenleft']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control><Shift><Alt>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last "['<Control><Shift><Alt>End']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Shift><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Shift><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control><Shift><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "['<Alt>F1']"
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Super>r']"
gsettings set org.gnome.desktop.wm.keybindings raise "[]"
gsettings set org.gnome.desktop.wm.keybindings raise-or-lower "[]"
gsettings set org.gnome.desktop.wm.keybindings set-spew-mark "[]"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab', '<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>Above_Tab', '<Alt>Above_Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>Above_Tab', '<Shift><Alt>Above_Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Super>space', 'XF86Keyboard']"
gsettings set org.gnome.desktop.wm.keybindings switch-panels "['<Control><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-panels-backward "['<Shift><Control><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Control><Alt>1', '<Super>Home']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Control><Alt>0']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-11 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-12 "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Control><Alt>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Control><Alt>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Control><Alt>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Control><Alt>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Control><Alt>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Control><Alt>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Control><Alt>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Control><Alt>9']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last "['<Control><Alt>End']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings toggle-above "[]"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>F11']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>F10']"
gsettings set org.gnome.desktop.wm.keybindings toggle-on-all-workspaces "[]"
gsettings set org.gnome.desktop.wm.keybindings toggle-shaded "[]"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>Down', '<Alt>F5']"

# TWEAKS - CUSTOM KEYBINDINGS
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Open Terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Control><Alt>t"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "Open Nautilus"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "nautilus"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>e"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "Open System Monitor"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "gnome-system-monitor"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "<Control><Shift>Escape"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"

# TWEAKS - DESKTOP
gsettings set org.gnome.desktop.interface enable-animations true
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

CURSOR_THEME=""
GTK_THEME=""

if [ "$INTERFACE_THEME" == "0" ]; then
    CURSOR_THEME="capitaine-cursors-light"

    if [ "$INTERFACE_SOLID" == "1" ]; then
        GTK_THEME="Mojave-dark-solid"
    else
        GTK_THEME="Mojave-dark"
    fi
else
    CURSOR_THEME="capitaine-cursors"

    if [ "$INTERFACE_SOLID" == "1" ]; then
        GTK_THEME="Mojave-light-solid"
    else
        GTK_THEME="Mojave-light"
    fi
fi

gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME"
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
gsettings set org.gnome.desktop.interface icon-theme 'la-capitaine'
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/gnome/mojave-timed.xml
gsettings set org.gnome.desktop.screensaver picture-uri file:///usr/share/backgrounds/gnome/mojave-timed.xml
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.desktop.interface enable-hot-corners false

# TWEAKS - USER-THEME
gsettings set org.gnome.shell.extensions.user-theme name "$GTK_THEME"

# TWEAKS - SHELL
gsettings set org.gnome.shell always-show-log-out true
gsettings set org.gnome.shell app-picker-view 1
gsettings set org.gnome.shell development-tools true
gsettings set org.gnome.shell disable-extension-version-validation true
gsettings set org.gnome.shell disable-user-extensions false
gsettings set org.gnome.shell enabled-extensions "['dash-to-dock@micxgx.gmail.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'appindicatorsupport@rgcjonas.gmail.com', 'pamac-updates@manjaro.org', 'horizontal-workspaces@gnome-shell-extensions.gcampax.github.com']"
gsettings set org.gnome.shell favorite-apps "['org.gnome.Epiphany.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.gedit.desktop', 'org.gnome.Terminal.desktop']"
gsettings set org.gnome.shell had-bluetooth-devices-setup false
gsettings set org.gnome.shell introspect false
gsettings set org.gnome.shell remember-mount-password false

# TWEAKS - TERMINAL
profile=$(gsettings get org.gnome.Terminal.ProfilesList default) && profile=${profile:1:-1}
gsettings set org.gnome.Terminal.Legacy.Settings confirm-close true
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar true
gsettings set org.gnome.Terminal.Legacy.Settings headerbar "nothing"
gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled true
gsettings set org.gnome.Terminal.Legacy.Settings mnemonics-enabled true
gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode "window"
gsettings set org.gnome.Terminal.Legacy.Settings schema-version 3
gsettings set org.gnome.Terminal.Legacy.Settings shell-integration-enabled true
gsettings set org.gnome.Terminal.Legacy.Settings shortcuts-enabled true
gsettings set org.gnome.Terminal.Legacy.Settings tab-policy 'automatic'
gsettings set org.gnome.Terminal.Legacy.Settings tab-position 'top'
gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'system'
gsettings set org.gnome.Terminal.Legacy.Settings unified-menu true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" allow-bold true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" audible-bell true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color "rgb(0,0,0)"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" backspace-binding "ascii-delete"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" bold-color "#000000"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" bold-color-same-as-fg true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" bold-is-bright false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cell-height-scale 1
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cell-width-scale 1
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cjk-utf8-ambiguous-width "narrow"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-background-color "#000000"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-blink-mode "on"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-colors-set false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-foreground-color "#ffffff"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-shape "block"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" custom-command ""
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 80
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 24
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" delete-binding "delete-sequence"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" enable-bidi true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" enable-shaping true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" encoding "UTF-8"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" exit-action "close"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" font "Hack 11"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color "rgb(170,170,170)"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" highlight-background-color "#000000"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" highlight-colors-set false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" highlight-foreground-color "#000000"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" login-shell false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(78,154,6)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" rewrap-on-resize true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scroll-on-keystroke true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scroll-on-output false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollback-lines 10000
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollback-unlimited false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollbar-policy "always"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" text-blink-mode "always"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-custom-command false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-system-font false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors false

# TWEAKS - EPIPHANY
BROWSER_THEME="light"

if [ "$INTERFACE_THEME" == 0 ]; then
    BROWSER_THEME="dark"
fi

gsettings set org.gnome.Epiphany ask-for-default true
gsettings set org.gnome.Epiphany default-search-engine "Google"
gsettings set org.gnome.Epiphany enable-caret-browsing false
gsettings set org.gnome.Epiphany homepage-url "https://www.google.com/"
gsettings set org.gnome.Epiphany internal-view-source true
gsettings set org.gnome.Epiphany new-windows-in-tabs true
gsettings set org.gnome.Epiphany restore-session-delaying-loads true
gsettings set org.gnome.Epiphany restore-session-policy "always"
gsettings set org.gnome.Epiphany search-engines "[('Google', 'https://www.google.com/search?q=%s', '!g')]"
gsettings set org.gnome.Epiphany start-in-incognito-mode false
gsettings set org.gnome.Epiphany warn-on-close-unsubmitted-data true
gsettings set org.gnome.Epiphany.reader color-scheme "$BROWSER_THEME"
gsettings set org.gnome.Epiphany.reader font-style "sans"
gsettings set org.gnome.Epiphany.state:/org/gnome/epiphany/state/ download-dir "Downloads"
gsettings set org.gnome.Epiphany.state:/org/gnome/epiphany/state/ is-maximized true
gsettings set org.gnome.Epiphany.state:/org/gnome/epiphany/state/ window-position "(0, 0)"
gsettings set org.gnome.Epiphany.state:/org/gnome/epiphany/state/ window-size "(0, 0)"
gsettings set org.gnome.Epiphany.ui expand-tabs-bar true
gsettings set org.gnome.Epiphany.ui keep-window-open false
gsettings set org.gnome.Epiphany.ui tabs-bar-position "top"
gsettings set org.gnome.Epiphany.ui tabs-bar-visibility-policy "more-than-one"
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ ask-on-download false
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ cookies-policy "no-third-party"
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ default-encoding "iso-8859-1"
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ default-zoom-level 1
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ do-not-track true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-adblock true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-autosearch true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-mouse-gestures true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-plugins false
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-popups true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-safe-browsing true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-site-specific-quirks true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-smooth-scrolling true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-spell-checking true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-user-css false
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-webaudio true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-webgl true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ hardware-acceleration-policy "on-demand"
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ language "['system']"
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ min-font-size 0
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ mobile-user-agent false
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ monospace-font "Monospace 10"
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ remember-passwords true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ sans-serif-font "Sans 10"
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ serif-font "Serif 10"
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ use-gnome-fonts true
gsettings set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ user-agent ""

# TWEAKS - GEDIT
gsettings set org.gnome.gedit.preferences.editor auto-indent true
gsettings set org.gnome.gedit.preferences.editor auto-save true
gsettings set org.gnome.gedit.preferences.editor auto-save-interval 3
gsettings set org.gnome.gedit.preferences.editor background-pattern "none"
gsettings set org.gnome.gedit.preferences.editor bracket-matching false
gsettings set org.gnome.gedit.preferences.editor create-backup-copy true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor display-overview-map false
gsettings set org.gnome.gedit.preferences.editor display-right-margin false
gsettings set org.gnome.gedit.preferences.editor editor-font "Hack 12"
gsettings set org.gnome.gedit.preferences.editor ensure-trailing-newline true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line false
gsettings set org.gnome.gedit.preferences.editor insert-spaces false
gsettings set org.gnome.gedit.preferences.editor max-undo-actions 2000
gsettings set org.gnome.gedit.preferences.editor restore-cursor-position true
gsettings set org.gnome.gedit.preferences.editor right-margin-position 80
gsettings set org.gnome.gedit.preferences.editor scheme "tango"
gsettings set org.gnome.gedit.preferences.editor search-highlighting true
gsettings set org.gnome.gedit.preferences.editor smart-home-end "after"
gsettings set org.gnome.gedit.preferences.editor syntax-highlighting true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor use-default-font true
gsettings set org.gnome.gedit.preferences.editor wrap-last-split-mode "char"
gsettings set org.gnome.gedit.preferences.editor wrap-mode "char"

# TWEAKS - DASH-TO-DOCK
gsettings set org.gnome.shell.extensions.dash-to-dock activate-single-window true
gsettings set org.gnome.shell.extensions.dash-to-dock animate-show-apps true
gsettings set org.gnome.shell.extensions.dash-to-dock animation-time 0.2
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-1 "['<Ctrl><Super>1']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-10 "['<Ctrl><Super>10']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-2 "['<Ctrl><Super>2']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-3 "['<Ctrl><Super>3']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-4 "['<Ctrl><Super>4']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-5 "['<Ctrl><Super>5']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-6 "['<Ctrl><Super>6']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-7 "['<Ctrl><Super>7']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-8 "['<Ctrl><Super>8']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-9 "['<Ctrl><Super>9']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-1 "['<Super>1']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-10 "['<Super>10']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-2 "['<Super>2']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-3 "['<Super>3']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-4 "['<Super>4']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-5 "['<Super>5']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-6 "['<Super>6']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-7 "['<Super>7']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-8 "['<Super>8']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-9 "['<Super>9']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-1 "['<Shift><Super>1']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-10 "['<Shift><Super>10']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-2 "['<Shift><Super>2']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-3 "['<Shift><Super>3']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-4 "['<Shift><Super>4']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-5 "['<Shift><Super>5']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-6 "['<Shift><Super>6']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-7 "['<Shift><Super>7']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-8 "['<Shift><Super>8']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-9 "['<Shift><Super>9']"
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide-in-fullscreen false
gsettings set org.gnome.shell.extensions.dash-to-dock background-color "#888a85"
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 1
gsettings set org.gnome.shell.extensions.dash-to-dock bolt-support true
gsettings set org.gnome.shell.extensions.dash-to-dock click-action "minimize"
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color "#ffffff"
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-width 0
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color "#ffffff"
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings set org.gnome.shell.extensions.dash-to-dock customize-alphas false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock force-straight-corner false
gsettings set org.gnome.shell.extensions.dash-to-dock height-fraction 0.9
gsettings set org.gnome.shell.extensions.dash-to-dock hide-delay 0.2
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys true
gsettings set org.gnome.shell.extensions.dash-to-dock hotkeys-overlay true
gsettings set org.gnome.shell.extensions.dash-to-dock hotkeys-show-dock true
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode "FOCUS_APPLICATION_WINDOWS"
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors false
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces false
gsettings set org.gnome.shell.extensions.dash-to-dock max-alpha 1
gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action "quit"
gsettings set org.gnome.shell.extensions.dash-to-dock min-alpha 0.2
gsettings set org.gnome.shell.extensions.dash-to-dock minimize-shift true
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor false
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor -1
gsettings set org.gnome.shell.extensions.dash-to-dock pressure-threshold 100
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-dominant-color false
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style "DEFAULT"
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action "do-nothing"
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-switch-workspace true
gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action "minimize"
gsettings set org.gnome.shell.extensions.dash-to-dock shift-middle-click-action "launch"
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut "['<Super>q']"
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-text "'<Super>q'"
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-timeout 2
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top false
gsettings set org.gnome.shell.extensions.dash-to-dock show-delay 0.25
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true
gsettings set org.gnome.shell.extensions.dash-to-dock show-running true
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button true
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true
gsettings set org.gnome.shell.extensions.dash-to-dock show-windows-preview true
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "FIXED"
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false

# QUIT GNOME SESSION
gnome-session-quit --force
