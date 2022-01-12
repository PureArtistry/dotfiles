local awful = require('awful')

---@diagnostic disable-next-line
local screen, tag = screen, tag

tag.connect_signal('request::default_layouts', function()
    awful.layout.append_default_layouts({ awful.layout.suit.tile })
end)

screen.connect_signal('request::desktop_decoration', function(s)
    awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, awful.layout.layouts[1])
end)
