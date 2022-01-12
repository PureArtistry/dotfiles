---@diagnostic disable-next-line
local client = client

local awful = require('awful')

awful.util.shell = 'sh'

-- TODO: fix this shit
require('config.deprecated').auto_focus()

-- TODO: move to signals.lua
client.connect_signal('mouse::enter', function(c)
    if client.focus ~= c then
        c:activate { context = 'mouse_enter', raise = false }
    end
end)
