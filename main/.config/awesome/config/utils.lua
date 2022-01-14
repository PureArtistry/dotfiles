---@diagnostic disable-next-line
-- local screen = screen

local spawn = require('awful.spawn')
local folder = os.getenv('WALLPAPERS')
local symlink = require('gears.filesystem').get_configuration_dir() .. 'assets/wallpaper'
local alert = require('naughty').notification

local function phase3()
    require('config.flavours')
    require('config.theme')
    require('config.deprecated').set_wall(symlink)
end

local function phase2(wallpaper)
    for k in pairs(package.loaded) do
        if k:match('config.theme') or k:match('config.flavours') then
            package.loaded[k] = nil
        end
    end
    spawn('ln -sf ' .. wallpaper .. ' ' .. symlink)
    spawn('ln -sf ' .. wallpaper .. ' ' .. os.getenv('STARTPAGE') .. '/style/cwplnk')
    spawn.with_line_callback('update_theme.sh', { exit = function (_) phase3() end })
end

local function apply(wallpaper)
    spawn.with_line_callback(
        'flavours generate dark ' .. wallpaper,
        {
            exit = function (_, r)
                if r ~= 0 then
                    alert({ message = r .. ' -> ' .. 'ERROR:\nfailed to generate colour palette!' })
                    return
                end
                phase2(wallpaper)
            end
        }
    )
end

local M = {}

function M.random_wall()
    local list = {}
    spawn.with_line_callback(
        'ls -1 ' .. folder,
        {
            stdout = function (x) table.insert(list, x) end,
            output_done = function ()
                if next(list) == nil then
                    alert({ message = 'ERROR:\nno wallpapers found!' })
                    return
                end
                math.randomseed(os.time())
                local i = math.random(1, #list)
                apply(folder .. '/' .. list[i])
            end
        }
    )
end

function M.select_wall()
    local wallpaper
    spawn.easy_async('sxiv -otb -N wallpapers ' .. folder, function (stdout, _, _, exit_code)
        if exit_code ~= 0 then
            alert({ message = 'ERROR!' })
            return
        end
        if not stdout:match '([^/]-([^.]+))$' then
            return
        end
        for l in stdout:gmatch('([^\n]*)\n?') do
            wallpaper = l
            break
        end
        apply(wallpaper)
    end)
end

return M
