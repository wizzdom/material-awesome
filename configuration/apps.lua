local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = "alacritty",
    rofi = rofi_command,
    lock = 'i3lock -c 0f0e17', --i3lock with a nice dark background
    quake = 'alacritty',
    screenshot = 'flameshot full -p ~/Pictures/screenshot/',
    region_screenshot = 'flameshot gui -p ~/Pictures/screenshot/',
    delayed_screenshot = 'flameshot full -p ~/Pictures/screenshot -d 5000',
    browser = 'firefox', -- brave-browser-nightly
    editor = 'code', -- text editor
    editor_cmd = os.getenv('EDITOR') or 'vim',
    social = 'discord',
    game = 'steam',
    files = 'nautilus',
    music = 'spotify' 
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    -- 'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'picom',
    'nitrogen --restore',
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1', -- polkit
    'nm-applet --indicator', -- wifi
    'pnmixer', -- shows an audiocontrol applet in systray when installed.
    --'blueberry-tray', -- Bluetooth tray icon
    'ibus-daemon --xim', -- Ibus daemon for keyboard
    'scream -u -p 4011 -i virbr1', -- scream audio sink
    'numlockx on', -- enable numlock
    '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xfce4-power-manager', -- Power manager
     'flameshot', -- Flameshot screenshot utility
    --  'synology-drive -minimized',
     'steam -silent',
    --  '/usr/bin/barrier', --not using barrier now but will be later
     '/home/wizzdom/.local/bin/wallpaper', -- wallpaper-reddit script
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn', -- Spawn "dirty" apps that can linger between sessions
    'viper-gui -st', -- Launch viper and keep gui in tray
    'mailspring --background' --Launch Mailspring mail client in tray
  }
}
