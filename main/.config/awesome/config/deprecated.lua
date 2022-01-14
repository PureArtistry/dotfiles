local spawn = require('awful.spawn')
local timer = require('gears.timer')

local M = {}

function M.auto_focus()
    return require('awful.autofocus')
end

function M.set_wall(p)
    require('gears.wallpaper').maximized(p)
    timer {
        timeout = 0.1,
        autostart = true,
        callback = function ()
            local pids = {}
            spawn.with_line_callback(
                'pgrep picom',
                {
                    stdout = function (x) table.insert(pids, x) end,
                    output_done = function ()
                        for _, z in pairs(pids) do
                            spawn('kill ' .. z)
                        end
                        timer {
                            timeout = 0.1,
                            autostart = true,
                            callback = function () spawn('picom -b --experimental-backends') end,
                            single_shot = true
                        }
                    end
                }
            )
        end,
        single_shot = true
    }
end

return M
