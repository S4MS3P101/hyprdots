# Hyprland Rice
This repository contains my personal Hyprland rice (configuration) to get a sleek and functional environment.
# Screenshots
![Screenshot](1.png)
![Screenshot](2.png)
# Dependencies
Before using this configuration, make sure to install the following dependencies.

Official Repository Dependencies
```bash
sudo pacman -S 7zip bluez-utils brightnessctl cliphist cpupower dconf-editor fastfetch ffmpegthumbnailer file-roller firefox fish foot fuzzel htop hypridle hyprland hyprlock hyprpolkitagent hyprshot hyprsunset imv libreoffice-still libva-utils mpv nautilus neovim net-tools nwg-look papers pavucontrol qt5ct qt6ct sassc starship swaync swayosd swww ufw waybar wf-recorder
```
# AUR Dependencies
The following packages are available only in the AUR, so you'll need an AUR helper like yay (or paru, trizen, etc.) to install them. 
1. Install yay if you don't have it yet:

```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
2. Then, install the AUR packages:
```bash
yay -S bibata-cursor-theme-bin bluetuith-bin librewolf-bin python-pywal16 ttf-ms-win11-auto
```
# Configuration
This is the configuration I use for Hyprland, Waybar, and some other applications. Feel free to modify it to suit your needs.
# Monitor setup
Configure your monitors using the monitor command. In this setup:

  - eDP-1 is the built-in laptop screen (1080p).

  - HDMI-A-1 is an external display, set to mirror the laptop screen.
```bash
monitor = eDP-1, 1920x1080@60, 0x0, 1
monitor = HDMI-A-1, 1920x1080@60, auto, 1, mirror, eDP-1
```
# Environment Variables
Set various environment variables for better compatibility and performance.
```bash
env = XCURSOR_THEME,Bibata-Modern-Classic
env = XCURSOR_SIZE,22
env = HYPRCURSOR_SIZE,22
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_TYPE,wayland
env = XDG_SESSION_DESKTOP,Hyprland
env = QT_QPA_PLATFORM,wayland;xcb
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = QT_QPA_PLATFORMTHEME,qt6ct
env = ELECTRON_OZONE_PLATFORM_HINT,auto

env = SWWW_TRANSITION,outer
env = SWWW_TRANSITION_POS,top-right
env = SWWW_TRANSITION_STEP,255
env = SWWW_TRANSITION_DURATION,1 
env = SWWW_TRANSITION_FPS,60
```
# Autostart Programs
This section autostarts essential processes such as Waybar, notifications, and background services:
```bash
  exec-once = waybar
  exec-once = hypridle
  exec-once = swaync
  exec-once = swayosd-server
  exec-once = systemctl --user start hyprpolkitagent
  exec-once = wl-paste --type text --watch cliphist store
# exec-once = hyprpm reload
  exec-once = hyprsunset
  exec-once = swww-daemon
```

## Keybindings
These are the main keyboard shortcuts configured for **Hyprdots** on Hyprland.  
`Super` refers to the Windows/Mod key.

### 🪟 Window & Tiling Management
| Shortcut | Action |
|----------|--------|
| `Super + Shift + Return` | Open terminal |
| `Super + Shift + C` | Kill active window |
| `Super + Shift + Q` | Exit Hyprland |
| `Super + E` | Open file manager |
| `Super + W` | Open browser |
| `Super + Shift + W` | Open browser in private mode |
| `Super + Space` | Toggle floating mode |
| `Super + R` | Open application menu |
| `Super + P` | Pseudo layout (dwindle) |
| `Super + J` | Toggle split (dwindle) |
| `Super + L` | Lock screen |
| `Super + C` | Launch color picker (`hyprpicker`) |

#### Move focus
| Shortcut | Action |
|----------|--------|
| `Super + Arrow keys` | Move focus between windows |

#### Swap windows
| Shortcut | Action |
|----------|--------|
| `Super + Shift + Arrow keys` | Swap active window in that direction |

---

### 📁 Workspace Management
| Shortcut | Action |
|----------|--------|
| `Super + 1..0` | Switch to workspace 1–10 |
| `Super + Shift + 1..0` | Move active window to workspace 1–10 |
| `Super + S` | Toggle scratchpad workspace "magic" |
| `Super + Tab` | Cycle through existing workspaces |
| `Super + Mouse Scroll` | Scroll through workspaces |

---

### 🖱 Mouse Bindings
| Shortcut | Action |
|----------|--------|
| `Super + LMB` | Move window |
| `Super + RMB` | Resize window |

---

### 🎛 Floating Window Navigation
| Shortcut | Action |
|----------|--------|
| `Alt + Tab` | Switch between windows in floating workspace |
| `Alt + Tab` | Bring active window to top |

---

### 🖥 System & Utilities
| Shortcut | Action |
|----------|--------|
| `Super + B` | Reload Waybar |
| `Super + Shift + B` | Toggle Waybar |
| `Super + Shift + S` | Screenshot selected region |
| `Print` | Screenshot active output |
| `Shift + Print` | Screenshot active window |
| `Super + V` | Paste from clipboard |
| `Super + Shift + V` | Clear clipboard |

---

### 🔊 Audio & Brightness (SwayOSD)
| Shortcut | Action |
|----------|--------|
| `XF86AudioMute` | Toggle mute |
| `XF86AudioRaiseVolume` | Increase volume |
| `XF86AudioLowerVolume` | Decrease volume |
| `XF86MonBrightnessUp` | Increase brightness |
| `XF86MonBrightnessDown` | Decrease brightness |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86AudioPlay/Pause` | Play/Pause media |

---

### 🔧 Notes
- All custom keybindings can be found in `~/.config/hypr/hyprland/keybindings.conf`.  
- Modify this file and reload Hyprland to apply changes.

# Window Rules
The following rules are applied to certain windows to ensure they open as floating or are ignored by certain effects.
```bash
 windowrule = float, class:foot
 windowrule = float, class:imv
 windowrule = float, class:mpv
 windowrule = float, class:nm-connection-editor
 windowrule = float, class:protonvpn-app
 windowrule = float, class:org.pulseaudio.pavucontrol
 windowrule = float, class:org.gnome.FileRoller
 windowrule = float, class:librewolf, title:About LibreWolf
 windowrule = float, class:org.kde.kdenlive

 layerrule = blur, wofi
 layerrule = blur, launcher
 layerrule = ignorezero, launcher
 layerrule = blur, waybar
 layerrule = ignorezero, waybar
 layerrule = blur, swaync-control-center
 layerrule = blur, swaync-notification-window
 layerrule = ignorezero, swaync-control-center
 layerrule = ignorezero, swaync-notification-window
 layerrule = animation slide top, swaync-control-center
 layerrule = animation slide bottom, launcher
 layerrule = blur, logout_dialog
 layerrule = noanim, wofi
 layerrule = noanim, swayosd
 layerrule = noanim, hyprpicker
 layerrule = noanim, swww-daemon
 layerrule = noanim, selection
```
### 🎨 Themes & Icon Pack

For the full visual experience, install the following:

- **Icon Pack**: Fluent‑icon‑theme — GitHub: https://github.com/vinceliuice/Fluent-icon-theme. Use the `grey` variant (or your preferred color) during installation.
- **GTK Theme**: Colloid‑gtk‑theme — GitHub: https://github.com/vinceliuice/Colloid-gtk-theme. Example install flags: `--tweaks black normal -s compact`.
