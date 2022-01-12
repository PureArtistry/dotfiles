local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

opt('o', 'tgc', true)
opt('o', 'title', true)

opt('o', 'lz', true)
opt('o', 'ut', 100)
vim.g.cursorhold_updatetime = 100
opt('o', 'tm', 300)

opt('o', 'backup', false)
opt('o', 'wb', false)
opt('o', 'swf', false)
opt('b', 'udf', true)

opt('o', 'hid', true)
opt('o', 'history', 1000)
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'mouse', 'a')

opt('o', 'ignorecase', true)
opt('o', 'scs', true)
opt('o', 'cot', 'menu,menuone,noselect')

-- opt('w', 'rnu', true)
opt('o', 'fcs', 'fold: ,eob: ')
opt('o', 'so', 15)
opt('w', 'wrap', false)
opt('o', 'sm', true)
opt('w', 'scl', 'yes')
opt('w', 'cul', true)
opt('o', 'smd', false)
opt('o', 'ph', 10)
opt('o', 'sb', true)
opt('o', 'spr', true)

opt('b', 'ts', 4)
opt('b', 'sw', 4)
opt('b', 'et', true)
opt('b', 'si', true)

vim.cmd('set isk+=-')
vim.cmd('set shm+=atc')
opt('o', 'icm', 'split')

opt('b', 'spl', 'en_gb')
-- opt('w', 'spell', true)

function NOTIFY(info)
    local ntype
    local t = info.type

    if USE_NOTIFY then
        if t == 'error' then ntype = vim.lsp.log_levels.ERROR
        elseif t == 'warn' then ntype = vim.lsp.log_levels.WARN
        elseif t == 'info' then ntype = vim.lsp.log_levels.INFO
        else ntype = t end
        require('notify')(info.msg, ntype, { title = info.title })
    else
        if t == 'error' then ntype = 'ERROR:'
        elseif t == 'warn' then ntype = 'WARNING:'
        else ntype = t .. ':' end
        print('[ERROR: could not load nvim-notify] ' .. ntype .. ' ' .. info.msg)
    end
end

function CONFIG_CHECK()
    if not CONFIG_GOOD then
        for _, x in pairs(CONFIG_ERRORS) do
            NOTIFY({ type = 'error', title = x.name, msg = x.msg })
        end
    end
    vim.cmd('redraw')
end

function IBL_TOGGLE_CHECK()
    if USE_IBL then
        local ibl_ok, ibl = pcall(require, 'indent_blankline.commands')
        if ibl_ok then
            ibl.enable(true)
            ibl.refresh(true)
        end
    end
end

local function define_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')
        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end
        vim.cmd('augroup END')
    end
end

define_augroups({
    _general_settings = {
        { 'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})' },
        { 'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' },
        { 'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' },
        { 'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' },
        { 'BufHidden', 'NvimTree', 'lua IBL_TOGGLE_CHECK()' },
        { 'VimEnter', '*', 'lua CONFIG_CHECK()' }
    },
    packer_user_config = {
        { 'BufWritePost', 'plugins.lua', 'source <afile> | PackerSync' }
    }
})
