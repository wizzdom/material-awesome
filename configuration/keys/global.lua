local awful = require('awful')
require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')
-- Key bindings
local globalKeys =
  awful.util.table.join(
  -- Hotkeys
  awful.key({modkey}, 's', hotkeys_popup.show_help, {description = 'show help', group = 'awesome'}),
  -- Tag browsing
  -- awful.key({modkey}, 'w', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
  -- awful.key({modkey}, 's', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
  awful.key({altkey, 'Control'}, 'Up', awful.tag.viewprev, {description = 'view previous', group = 'tag'}),
  awful.key({altkey, 'Control'}, 'Down', awful.tag.viewnext, {description = 'view next', group = 'tag'}),
  awful.key({modkey}, 'Escape', awful.tag.history.restore, {description = 'go back', group = 'tag'}),
  -- Default client focus
  awful.key(
    {modkey},
    'd',
    function()
      awful.client.focus.byidx(1)
    end,
    {description = 'focus next by index', group = 'client'}
  ),
  awful.key(
    {modkey},
    'a',
    function()
      awful.client.focus.byidx(-1)
    end,
    {description = 'focus previous by index', group = 'client'}
  ),
  awful.key(
    {modkey},
    'r',
    function()
      _G.screen.primary.left_panel:toggle(true)
    end,
    {description = 'show main menu', group = 'awesome'}
  ),
  awful.key(
    {altkey},
    'space',
    function()
      _G.screen.primary.left_panel:toggle(true)
    end,
    {description = 'show main menu', group = 'awesome'}
  ),
  awful.key({modkey}, 'u', awful.client.urgent.jumpto, {description = 'jump to urgent client', group = 'client'}),
  awful.key(
    {altkey},
    'Tab',
    function()
      --awful.client.focus.history.previous()
      awful.client.focus.byidx(1)
      if _G.client.focus then
        _G.client.focus:raise()
      end
    end,
    {description = 'Switch to next window', group = 'client'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Tab',
    function()
      --awful.client.focus.history.previous()
      awful.client.focus.byidx(-1)
      if _G.client.focus then
        _G.client.focus:raise()
      end
    end,
    {description = 'Switch to previous window', group = 'client'}
  ),
  -- Programs
  -- Lock screen
  awful.key(
    {modkey},
    'l',
    function()
      awful.spawn(apps.default.lock)
    end,
    {description = 'Lock the screen', group = 'awesome'}
  ),
  -- Screenshot
  -- 10 second delay screenshot
  awful.key(
    {modkey, 'Control'},
    'Print',
    function()
      awful.util.spawn_with_shell(apps.default.delayed_screenshot)
    end,
    {description = 'Screenshot with a 10 second delay (Flameshot)', group = 'screenshots'}
  ),
  -- screenshot (Regular Screenshot)
  awful.key(
    {},
    'Print',
    function()
      awful.util.spawn_with_shell(apps.default.screenshot)
    end,
    {description = 'Take a screenshot of your active monitor (Flameshot)', group = 'screenshots'}
  ),
  -- region screenshot
  awful.key(
    {'Control'},
    'Print',
    function()
      awful.util.spawn_with_shell(apps.default.region_screenshot)
    end,
    {description = 'Mark an area and screenshot it (Flameshot)', group = 'screenshots'}
  ),
  -- Code/Text Editor
  awful.key(
    {modkey},
    'c',
    function()
      awful.util.spawn(apps.default.editor)
    end,
    {description = 'open a text/code editor', group = 'launcher'}
  ),
  -- Default Browser (Firefox)
  awful.key(
    {modkey},
    'b',
    function()
      awful.util.spawn(apps.default.browser)
    end,
    {description = 'open default browser', group = 'launcher'}
  ),
  -- Alt Browser (Brave)
  awful.key(
    {modkey, 'Shift'},
    'b',
    function()
      awful.util.spawn(apps.default.altbrowser)
    end,
    {description = 'open alt browser', group = 'launcher'}
  ),

-- Mail application (Thunderbird via Birdtray)
   awful.key(
    {modkey},
    'm',
    function()
      awful.util.spawn('birdtray -t')
    end,
    {description = 'show/hide Thunderbird', group = 'launcher'}
  ),
 -- Default Music Player
  awful.key(
    {modkey, 'Shift'},
    'm',
    function()
      awful.util.spawn(apps.default.music)
    end,
    {description = 'open music player', group = 'launcher'}
  ),
  -- Standard program
  -- Terminal
  awful.key(
    {modkey},
    'Return',
    function()
      awful.spawn(apps.default.terminal)
    end,
    {description = 'open a terminal', group = 'launcher'}
  ),
  -- Reload Awesome
  awful.key({modkey, 'Control'}, 'r', _G.awesome.restart, {description = 'reload awesome', group = 'awesome'}),
  -- Quit Awesome
  awful.key({modkey, 'Control'}, 'q', _G.awesome.quit, {description = 'quit awesome', group = 'awesome'}),
  --
  -- Layout Group
  --
  awful.key(
    {altkey, 'Shift'},
    'Right',
    function()
      awful.tag.incmwfact(0.05)
    end,
    {description = 'increase master width factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Left',
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = 'decrease master width factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Down',
    function()
      awful.client.incwfact(0.05)
    end,
    {description = 'decrease master height factor', group = 'layout'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'Up',
    function()
      awful.client.incwfact(-0.05)
    end,
    {description = 'increase master height factor', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Left',
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = 'increase the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Right',
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = 'decrease the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Left',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = 'increase the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Right',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = 'decrease the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey},
    'space',
    function()
      awful.layout.inc(1)
    end,
    {description = 'select next', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'space',
    function()
      awful.layout.inc(-1)
    end,
    {description = 'select previous', group = 'layout'}
  ),


  awful.key(
    {modkey, 'Control'},
    'n',
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        _G.client.focus = c
        c:raise()
      end
    end,
    {description = 'restore minimized', group = 'client'}
  ),
  -- Dropdown application
  awful.key(
    {modkey},
    'z',
    function()
      _G.toggle_quake()
    end,
    {description = 'dropdown application', group = 'launcher'}
  ),
  -- Widgets popups
  --[[awful.key(
    {altkey},
    'h',
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = 'show filesystem', group = 'widgets'}
  ),
  awful.key(
    {altkey},
    'w',
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = 'show weather', group = 'widgets'}
  ),--]]

  -- Brightness
  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      awful.spawn('xbacklight -inc 10')
    end,
    {description = 'Brightness +10%', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      awful.spawn('xbacklight -dec 10')
    end,
    {description = 'Brightness -10%', group = 'hotkeys'}
  ),
  -- ALSA volume control
  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%+')
    end,
    {description = 'volume up', group = 'hotkeys'}
  ),
  -- Volume down
  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%-')
    end,
    {description = 'volume down', group = 'hotkeys'}
  ),
  -- Toggle Mute
  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle')
    end,
    {description = 'toggle mute', group = 'hotkeys'}
  ),
  -- MEDIA KEYS
  -- Play/Pause 
   awful.key({ },
    "XF86AudioPlay",
     function ()
       awful.util.spawn("playerctl play-pause", false) -- old:(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause)
      end,
    {description = 'Play/Pause media player', group = 'hotkeys'}
  ),
  -- Next Track
   awful.key({ },
    "XF86AudioNext",
     function ()
       awful.util.spawn("playerctl next", false) -- old:(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next)
     end,
     {description = 'Next Track', group = 'hotkeys'}
    ),
    -- Previous Track
   awful.key({ },
    "XF86AudioPrev",
     function ()
       awful.util.spawn("playerctl previous", false) -- old:(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous)
     end,
    {description = 'Previous Track', group = 'hotkeys'}
    ),
    -- Stop
   awful.key({ },
    "XF86AudioStop",
     function ()
       awful.util.spawn("playerctl stop", false) -- old:(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop)
       end,
      {description = 'Stop media player', group = 'hotkeys'}
      ),
  -- More media keys - rebind useless keys on laptopto function as media keys
  -- Play/Pause 
   awful.key({ },
    "XF86Tools",
     function ()
       awful.util.spawn("playerctl play-pause", false) -- old:(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause)
      end,
    {description = 'Play/Pause media player', group = 'hotkeys'}
  ),
  -- Next Track
   awful.key({ },
    "XF86LaunchA",
     function ()
       awful.util.spawn("playerctl next", false) -- old:(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next)
     end,
     {description = 'Next Track', group = 'hotkeys'}
    ),
    -- Previous Track
   awful.key({ },
    "XF86Search",
     function ()
       awful.util.spawn("playerctl previous", false) -- old:(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous)
     end,
    {description = 'Previous Track', group = 'hotkeys'}
    ),
    -- Stop
   awful.key({ },
    "XF86Explorer",
     function ()
       awful.util.spawn("playerctl stop", false) -- old:(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop)
       end,
      {description = 'Stop media player', group = 'hotkeys'}
      ),

  -- Power button - Prompt power options
  awful.key(
    {},
    'XF86PowerOff',
    function()
      _G.exit_screen_show()
    end,
    {description = 'power options', group = 'hotkeys'}
  ),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      _G.exit_screen_show()
    end,
    {description = 'power options', group = 'hotkeys'}
  ),
  -- Screen management
  -- Move window to other screen
  awful.key(
    {modkey},
    'o',
    awful.client.movetoscreen,
    {description = 'move window to next screen', group = 'client'}
  ),
  -- Open default program for tag
  awful.key(
    {modkey},
    't',
    function()
      awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = _G.mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
    end,
    {description = 'open default program for tag/workspace', group = 'tag'}
  ),



  -- Custom hotkeys
  -- vfio integration
  awful.key(
    {'Control',altkey},
    'space',
    function()
      awful.util.spawn_with_shell('vm-attach attach')
    end
  ),
  -- Lutris hotkey
  awful.key(
    {modkey},
    'g',
    function()
      awful.util.spawn_with_shell('lutris')
    end
  ),
  -- System Monitor hotkey
  -- awful.key(
  --   {modkey},
  --   'm',
  --   function()
  --     awful.util.spawn_with_shell('mate-system-monitor')
  --   end
  -- ),
  -- Kill VLC
  awful.key(
    {modkey},
    'v',
    function()
      awful.util.spawn_with_shell('killall -9 vlc')
    end
  ),
  -- File Manager
  awful.key(
    {modkey},
    'e',
    function()
      awful.util.spawn(apps.default.files)
    end,
    {description = 'open file browser', group = 'launcher'}
  ),
  -- Emoji Picker
  awful.key(
    {modkey},
    'a',
    function()
      awful.util.spawn_with_shell('ibus emoji')
    end,
    {description = 'Open ibus emoji picker to copy an emoji to your clipboard', group = 'hotkeys'}
  )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = 'view tag #', group = 'tag'}
    descr_toggle = {description = 'toggle tag #', group = 'tag'}
    descr_move = {description = 'move focused client to tag #', group = 'tag'}
    descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
  end
  globalKeys =
    awful.util.table.join(
    globalKeys,
    -- View tag only.
    awful.key(
      {modkey},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      descr_view
    ),
    -- Toggle tag display.
    awful.key(
      {modkey, 'Control'},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      descr_toggle
    ),
    -- Move client to tag.
    awful.key(
      {modkey, 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    ),
    -- Toggle tag on focused client.
    awful.key(
      {modkey, 'Control', 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:toggle_tag(tag)
          end
        end
      end,
      descr_toggle_focus
    )
  )
end

return globalKeys
