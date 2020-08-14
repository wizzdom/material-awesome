## Material and Mouse driven theme for [AwesomeWM 4.3](https://awesomewm.org/)

### Original work by PapyElGringo, official development seem to have moved to [material-shell](https://github.com/PapyElGringo/material-shell)

---

### This is a fork of [Chris Titus](https://github.com/ChrisTitusTech/material-awesome)'s material-awesome who forked it from [HikariKnight](https://github.com/HikariKnight/material-awesome)'s fork of the [original project](https://github.com/material-shell/material-awesome)

### Note: This fork focuses on adding more documentation and comments, customising it to my workflow and making it more accessible

An almost desktop environment made with [AwesomeWM](https://awesomewm.org/) following the [Material Design guidelines](https://material.io) with a performant opiniated mouse/keyboard workflow to increase daily productivity and comfort.

[![](./theme/PapyElGringo-theme/demo.gif?raw=true)](https://www.reddit.com/r/unixporn/comments/anp51q/awesome_material_awesome_workflow/)
_[Click to view in high quality](https://www.reddit.com/r/unixporn/comments/anp51q/awesome_material_awesome_workflow/)_

|                Tiled                 |                Panel                 |             Exit screen              |
| :----------------------------------: | :----------------------------------: | :----------------------------------: |
| ![](https://i.imgur.com/fELCtep.png) | ![](https://i.imgur.com/7IthpQS.png) | ![](https://i.imgur.com/rcKOLYQ.png) |

## Installation

### Note: the best transition is from gnome to material-awesome as KDE-plasma can break some indicators until plasma is purged entierly.

### 1) Get all the dependencies

```
sudo apt install awesome fonts-roboto rofi compton i3lock xclip qt5-style-plugins materia-gtk-theme lxappearance xbacklight kde-spectacle nautilus xfce4-power-manager pnmixer network-manager-applet -y
wget -qO- https://git.io/papirus-icon-theme-install | sh
```

#### Program list

- [AwesomeWM](https://awesomewm.org/) as the window manager - universal package install: `awesome`
- [Roboto](https://fonts.google.com/specimen/Roboto) as the font - **Debian**: `fonts-roboto` **Arch**: `ttf-roboto`
- [Rofi](https://github.com/DaveDavenport/rofi) for the app launcher - universal install: `rofi`
- [Picom (formerly Compton)](https://github.com/yshui/picom) for the compositor (blur and animations) universal install: `picom`
- [i3lock](https://github.com/meskarune/i3lock-fancy) the lockscreen application **Arch Install**: `i3lock` **Debian**: `i3lock-fancy`
<!-- - [xclip](https://github.com/astrand/xclip) for copying screenshots to clipboard package: `xclip` -->
- `gnome-keyring` and a policykit-agent (by default `policykit-1-gnome` is enabled) OR `mate-polkit`
- [Materia](https://github.com/nana-4/materia-theme) as GTK theme - **Arch Install**: `materia-theme` **Debian**: `materia-gtk-theme`
- [Papirus Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) as icon theme
  - Arch: `papirus-icon-theme`in the AUR, or `yay -S --needed papirus-icon-theme`
  - Universal Install: wget -qO- https://git.io/papirus-icon-theme-install | sh
- [lxappearance](https://sourceforge.net/projects/lxde/files/LXAppearance/) to set up the gtk and icon theme
- (Laptop) [xbacklight](https://www.x.org/archive/X11R7.5/doc/man/man1/xbacklight.1.html) for adjusting brightness on laptops (disabled by default)
- [flameshot](https://flameshot.js.org/#/) a fantastic screenshot utility. **Install**: `flameshot`
- [pnmixer](https://github.com/nicklan/pnmixer) Audio Tray icon that is in debian repositories and is easily installed on arch through AUR.
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet) `nm-applet` is a Network Manager Tray display from GNOME.
- [xfce4-power-manager](https://docs.xfce.org/xfce/xfce4-power-manager/start) XFCE4's power manager is excellent and a great way of dealing with sleep, monitor timeout, and other power management features.

### 2) Clone the configuration

```
git clone https://github.com/wizzdom/material-awesome.git ~/.config/awesome
```

### 3) Set the themes

Start `lxappearance` to active the **icon** theme and **GTK** theme
Note: for cursor theme, edit `~/.icons/default/index.theme` and `~/.config/gtk3-0/settings.ini`, for the change to also show up in applications run as root, copy the 2 files over to their respective place in `/root`.

### 4) Same theme for Qt/KDE applications and GTK applications, and fix missing indicators

First install `qt5-style-plugins` (debian) | `qt5-styleplugins` (arch) and add this to the bottom of your `/etc/environment`

```bash
XDG_CURRENT_DESKTOP=Unity
QT_QPA_PLATFORMTHEME=gtk2
```

The first variable fixes most indicators (especially electron based ones!), the second tells Qt and KDE applications to use your gtk2 theme set through lxappearance.

### 5) Read the documentation

The documentation live within the source code.

The project is split in functional directories and in each of them there is a readme where you can get additional information about the them.

- [Configuration](./configuration) is about all the **settings** available
- [Layout](./layout) hold the **disposition** of all the widgets
- [Module](./module) contain all the **features** available
- [Theme](./theme) hold all the **aesthetic** aspects
- [Widget](./widget) contain all the **widgets** available
