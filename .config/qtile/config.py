# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import layout, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match
from libqtile.core.manager import Qtile
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

def focus_left_window(qtile: Qtile):
    # current window
    current_window = qtile.current_window
    screen_windows = qtile.current_group.windows

    # if there's a window on the left of the current window
    if screen_windows.index(current_window) > 0:
        qtile.current_group.focus(
            screen_windows[screen_windows.index(current_window) - 1])
        return

    # if there's a window on the screen on the left
    current_screen = qtile.current_screen
    current_screen_index = qtile.screens.index(current_screen)
    if current_screen_index < len(qtile.screens) - 1:
        qtile.focus_screen(current_screen_index + 1)
        return


def focus_right_window(qtile: Qtile):
    # current window
    current_window = qtile.current_window
    screen_windows = qtile.current_group.windows

    # if there's a window on the right of the current window
    if screen_windows.index(current_window) < len(screen_windows) - 1:
        qtile.current_group.focus(
            screen_windows[screen_windows.index(current_window) + 1])
        return

    # if there's a window on the screen on the right
    current_screen = qtile.current_screen
    current_screen_index = qtile.screens.index(current_screen)
    if current_screen_index > 0:
        qtile.focus_screen(current_screen_index - 1)
        return


keys = [
    Key([mod], "d", lazy.spawn("dmenu_run"), desc="Launch dmenu"),
    Key([mod], "b", lazy.spawn("firefox"), desc="Launch Firefox"),
    Key([mod], "g", lazy.spawn("google-chrome-stable"),
        desc="Launch Google Chrome"),
    Key([mod], "F1", lazy.spawn("systemctl suspend"), desc="Suspend"),

    # alt + shift + h
    Key(["mod1", "shift"], "h", lazy.window.toscreen(
        1), desc="Move window to screen 0"),
    Key(["mod1", "shift"], "l", lazy.window.toscreen(
        0), desc="Move window to screen 1"),

    # volume control
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"), desc="Volume up"),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"), desc="Volume down"),
    Key([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc="Volume mute"),

    # brightness control
    Key([], "XF86MonBrightnessUp", lazy.spawn(
        "brightnessctl set +10%"), desc="Brightness up"),
    Key([], "XF86MonBrightnessDown", lazy.spawn(
        "brightnessctl set 10%-"), desc="Brightness down"),

    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.function(focus_left_window),
        lazy.window.bring_to_front(), desc="Move focus to left"),
    Key([mod], "l", lazy.function(focus_right_window),
        lazy.window.bring_to_front(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(),
        lazy.window.bring_to_front(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(),
        lazy.window.bring_to_front(), desc="Move focus up"),
    Key([mod], "space", lazy.group.next_window(),
        lazy.window.bring_to_front(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "t", lazy.spawn("kitty -e tmux"), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod, "shift"], "space", lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(
                func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

groups = [Group(i) for i in '123456789']

def go_to_group(index: int):
    def _inner(qtile):
        if len(qtile.screens) == 1:
            qtile.groups_map[str(index+1)].toscreen()
            return

        qtile.groups_map[str(index+1)].toscreen(0)
        qtile.groups_map["{}".format(index+1+10)].toscreen(1)

    return _inner

def move_to_group(index: int):
    def _inner(qtile):
        if len(qtile.screens) == 1:
            qtile.current_window.togroup(str(index+1))
            return

        # check what screen the window is on
        if int(qtile.current_window.info()['group']) < 10:
            qtile.current_window.togroup(str(index+1))
        else:
            qtile.current_window.togroup("{}".format(index+1+10))

    return _inner

for i in range(len(groups)):
    keys.append(Key([mod], str(i+1), lazy.function(go_to_group(i))))
    keys.append(Key([mod, "shift"], str(i+1), lazy.function(move_to_group(i))))

for i in range(len(groups)):
    groups.append(Group("{}".format(i+1+10), screen_affinity=1))

layout_theme = {
    "border_width": 2,
    "border_focus": "#c4c400",
    "margin": 5,
    "border_on_single": True,
}

layouts = [
    layout.Columns(**layout_theme),
    layout.Max(),
    layout.MonadTall(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = []

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="pavucontrol"),  # pavucontrol
        Match(wm_class="Blueman-manager"),
    ],
    border_width=2,
    border_focus="#c4c400",
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def startup_once():
    home = os.path.expanduser('~/.config/qtile/startup_once.sh')
    subprocess.call([home])

@hook.subscribe.startup
def startup():
    home = os.path.expanduser('~/.config/qtile/startup.sh')
    subprocess.call([home])
