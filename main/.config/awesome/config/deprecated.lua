local M = {}

function M.auto_focus()
    return require('awful.autofocus')
end

function M.set_wall(p)
    local r, _ = pcall(require('gears.wallpaper').maximized(p), '')
    if r then require('awful').spawn('restart_compton.sh') end
end

return M
