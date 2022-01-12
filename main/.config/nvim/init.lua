CONFIG_GOOD = true
CONFIG_ERRORS = {}

function PREQ(ret, thing)
    if ret then
        local s, r = pcall(require, thing)
        return { s, r }
    else
        local s, _ = pcall(require, thing)
        return s
    end
end

require('options')
require('base')
require('flavours')

if not PREQ(false, 'plugins') then
    vim.cmd('autocmd VimEnter * lua print("ERROR: packer is fucked, config not loaded!")')
    return
end

local list = {
    'keys',
    'git',
    'syntax',
    'lsp',
    'completion',
    'ui'
}

for _, name in pairs(list) do
    local x = PREQ(true, name)
    if not x[1] then
        CONFIG_GOOD = false
        table.insert(CONFIG_ERRORS, { name = name, msg = x[2] })
    end
end

require('theme').setup(FLAVOURS)

if USE_NOTIFY then
    if PREQ(false, 'nv-notify') then
        vim.notify = require('notify')
    else
        USE_NOTIFY = false
        CONFIG_GOOD = false
        table.insert(
            CONFIG_ERRORS,
            { name = 'nvim-notify', msg = 'failed to load nvim-notify!' }
        )
    end
end

if not PREQ(false, 'dashboard') then
    CONFIG_GOOD = false
    table.insert(
        CONFIG_ERRORS,
        { name = 'alpha-nvim', msg = 'failed to load the dashboard!' }
    )
end
