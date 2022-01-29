---@diagnostic disable-next-line
local awesome, client = awesome, client

-- local alert = require('naughty').notification
local awful = require('awful')
local spawn = awful.spawn
local utils = require('config.utils')

local hotkeys_popup = require('awful.hotkeys_popup')
require('config.external_hotkeys')

local terminal = os.getenv('TERMINAL')
local browser = [[ qutebrowser \
    --qt-flag ignore-gpu-blocklist \
    --qt-flag enable-gpu-rasterization \
    --qt-flag enable-native-gpu-memory-buffers \
    --qt-flag num-raster-threads=4 \
    --qt-flag enable-accelerated-video-decode
]]

awful.mouse.append_global_mousebindings({
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})

-- awesome control keys
-- main
awful.keyboard.append_global_keybindings({
    awful.key(
        { 'Mod4' },
        'F1',
        hotkeys_popup.show_help, -- TODO: this needs to be a function to check for D3 and toggle macro instead
        { description='--> show help', group='awesome: main' }
    ),
    awful.key(
        { 'Mod4' },
        'Escape',
        awesome.restart,
        { description = '--> reload awesome', group = 'awesome: main' }
    ),
    awful.key(
        { 'Mod4', 'Shift' },
        'q',
        awesome.quit,
        { description = '--> quit awesome', group = 'awesome: main' }
    ),
    awful.key(
        { 'Mod4' },
        'BackSpace',
        function ()
            for _, c in ipairs(client.get()) do
                if c.class == 'companion' then
                    c.sticky = true
                    if c.active then
                        c.hidden = true
                        return
                    end
                    c.hidden = false
                    c:activate({})
                    return
                end
            end
            spawn(terminal .. " --class 'companion','companion' --title 'companion'")
        end,
        { description = '--> toggle companion terminal', group = 'awesome: main' }
    )
})

-- theme
awful.keyboard.append_global_keybindings({
    awful.key(
        { 'Mod4' },
        'n',
        function () utils.random_wall() end,
        { description = '--> random new wallpaper', group = 'awesome: theme' }
    ),
    awful.key(
        { 'Mod4', 'Shift' },
        'n',
        function () utils.select_wall() end,
        { description = '--> select new wallpaper', group = 'awesome: theme' }
    )
})

-- cycle
awful.keyboard.append_global_keybindings({
    awful.key(
        { 'Mod4' },
        'Left',
        awful.tag.viewprev,
        { description = '--> previous tag', group = 'awesome: cycle (by index)' }
    ),
    awful.key(
        { 'Mod4' },
        'Right',
        awful.tag.viewnext,
        { description = '--> next tag', group = 'awesome: cycle (by index)' }
    ),
    awful.key(
        { 'Mod4' },
        'Up',
        function () awful.client.focus.byidx(-1) end,
        { description = '--> previous window', group = 'awesome: cycle (by index)' }
    ),
    awful.key(
        { 'Mod4' },
        'Down',
        function () awful.client.focus.byidx(1) end,
        { description = '--> next window', group = 'awesome: cycle (by index)' }
    )
})

-- tag
awful.keyboard.append_global_keybindings({
    awful.key(
        { 'Mod4' },
        '`',
        awful.tag.history.restore,
        { description = '--> last tag', group = 'awesome: tag' }
    )
})

-- launch keys
awful.keyboard.append_global_keybindings({
    awful.key(
        { 'Mod4' },
        'Return',
        function () spawn(terminal) end,
        { description = '--> ' .. terminal .. ' (terminal)', group = 'launch' }
    ),
    awful.key(
        { 'Mod4', 'Mod1' },
        'Return',
        function () spawn(browser) end,
        { description = '--> qutebrowser (browser)', group = 'launch' }
    ),
    awful.key(
        { 'Mod4', 'Shift' },
        'Return',
        function () spawn(terminal .. ' -e lf') end,
        { description = '--> lf (file manager)', group = 'launch' }
    ),
})
for n = 6,8,1 do
    awful.keyboard.append_global_keybindings({
        awful.key(
        { 'Mod4', 'Mod1' },
        'F' .. n,
        function () spawn(terminal .. " --class 'ncpamixer','ncpamixer' --title 'ncpamixer' -e ncpamixer") end,
        { description = '--> ncpamixer (audio mixer)', group = 'launch' }
        )
    })
end

-- system keys
awful.keyboard.append_global_keybindings({
    -- backlight
    awful.key(
        { 'Mod4' },
        'F4',
        function () spawn.with_shell('xbacklight -dec 5') end, -- TODO: add notification
        { description = '--> decrease backlight intensity by 5%', group = 'system: backlight' }
    ),
    awful.key(
        { 'Mod4' },
        'F5',
        function () spawn.with_shell('xbacklight -inc 5') end, -- TODO: add notification
        { description = '--> increase backlight intensity by 5%', group = 'system: backlight' }
    ),
    -- volume
    awful.key(
        { 'Mod4' },
        'F6',
        function () spawn.with_shell('pactl set-sink-mute @DEFAULT_SINK@ toggle') end, -- TODO: add notification
        { description = '--> toggle volume mute', group = 'system: volume' }
    ),
    awful.key(
        { 'Mod4' },
        'F7',
        function () spawn.with_shell('pactl set-sink-volume @DEFAULT_SINK@ -5%') end, -- TODO: add notification
        { description = '--> decrease volume by 5%', group = 'system: volume' }
    ),
    awful.key(
        { 'Mod4' },
        'F8',
        function () spawn.with_shell('pactl set-sink-volume @DEFAULT_SINK@ +5%') end, -- TODO: add notification
        { description = '--> increase volume by 5%', group = 'system: volume' }
    ),
    awful.key(
        { },
        'Print',
        function () spawn.with_shell('ffmpeg -f x11grab -video_size 1920x1080 -i "$DISPLAY" -vframes 1 ~/stuff/images/capture/scrot_$(date \'+%Y%m%d-%H%M%S\').png') end,
        { description = '--> take a screenshot', group = 'system: capture' }
    ),
})

-- mpd keys
local mpc_cmd = 'mpc -q '
-- local mpc_cmd = 'mpc --host=/tmp/mpd.sock -q '
local mpc = {
    { k = 'F9',  m = 'toggle', d = 'toggle mpd playback' },
    { k = 'F10', m = 'stop',   d = 'stop mpd playback' },
    { k = 'F11', m = 'prev',   d = 'previous song' },
    { k = 'F12', m = 'next',   d = 'next song' }
}
for _, x in pairs(mpc) do
    awful.keyboard.append_global_keybindings({
        awful.key(
            { 'Mod4' },
            x.k,
            function () spawn.with_shell(mpc_cmd .. x.m) end,
            { description = '--> ' .. x.d, group = 'mpd' }
        )
    })
end
awful.keyboard.append_global_keybindings({
    awful.key(
        { 'Mod4', 'Shift' },
        'F11',
        function () spawn.with_shell(mpc_cmd .. 'seek 0') end,
        { description = '--> restart song', group = 'mpd' }
    ),
    awful.key(
        { 'Mod4' },
        'm',
        function () spawn('rinse') end,
        { description = '--> select a song', group = 'mpd' }
    )
})

---------------------------------------------------------------------------------------------

awful.keyboard.append_global_keybindings({
    awful.key({ 'Mod4',           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
    awful.key({ 'Mod4', "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ 'Mod4', "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    -- awful.key({ 'Mod4', "Control" }, "n",
    --           function ()
    --               local c = awful.client.restore()
    --               -- Focus restored client
    --               if c then
    --                 c:activate { raise = true, context = "key.unminimize" }
    --               end
    --           end,
    --           {description = "restore minimized", group = "client"}),
})

awful.keyboard.append_global_keybindings({
    awful.key({ 'Mod4', "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ 'Mod4', "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ 'Mod4',           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ 'Mod4',           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ 'Mod4',           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ 'Mod4', "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ 'Mod4', "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ 'Mod4', "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ 'Mod4', "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ 'Mod4',           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ 'Mod4', "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
})

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { 'Mod4' },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { 'Mod4', "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { 'Mod4', "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { 'Mod4', "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { 'Mod4' },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ 'Mod4' }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ 'Mod4' }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ 'Mod4',           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ 'Mod4', "Shift"   }, "c",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
        awful.key({ 'Mod4', "Control" }, "space",  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),
        awful.key({ 'Mod4', "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
        awful.key({ 'Mod4',           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),
        awful.key({ 'Mod4',           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
        awful.key({ 'Mod4',           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        -- awful.key({ 'Mod4',           }, "m",
        --     function (c)
        --         c.maximized = not c.maximized
        --         c:raise()
        --     end ,
        --     {description = "(un)maximize", group = "client"}),
        awful.key({ 'Mod4', "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        awful.key({ 'Mod4', "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)
