--[[
Modes:
    insert = 'i'
    term = 't'
    command = 'c'
]]

function TREE_TOGGLE()
    if vim.bo.filetype ~= 'alpha' then
        if not packer_plugins['nvim-tree.lua'].loaded then
            local nt_ok = pcall(require('packer').loader, 'nvim-tree.lua')
            if not nt_ok then return end -- TODO: add a notification here!
        end
        local ntv = require('nvim-tree.view')
        if not ntv.win_open() then
            if USE_IBL then
                local ibl = PREQ(true, 'indent_blankline.commands')
                if ibl[1] then ibl[2].disable(true) end
            end
        end
        require('nvim-tree').toggle()
    end
end

vim.api.nvim_set_keymap('', '<f1>', '<cmd>lua TREE_TOGGLE()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = [[ ]]

local wk_ok = PREQ(true, 'which-key')
if not wk_ok[1] then error('failed to load which-key: no keymaps have been set!') end
local wk = wk_ok[2]

wk.setup {
    plugins = { spelling = { enabled = true }},
    key_labels = {
        ['<leader>'] = 'SPC',
        ['<space>'] = 'SPC',
        ['<CR>'] = ' ',
        ['<Tab>'] = ' ',
        ['<S-Tab>'] = '[S]  ',
        -- TODO: more to be added here later...
    },
    icons = { separator = '➜ ', group = '+ ' },
    window = { border = 'single' },
    layout = {
        spacing = 10,
        align = 'center'
    }
}

-- normal mode [n]
wk.register({
    ['<F1>'] = { '<cmd>lua TREE_TOGGLE()<CR>', 'Toggle file manager' },
    ['<Tab>'] = { '<cmd>bnext<CR>', 'Next buffer' },
    ['<S-Tab>'] = { '<cmd>bprevious<CR>', 'Previous buffer' },
    ['<M-j>'] = { '<Esc>:m .+1<CR>==gi', 'Move line down' },
    ['<M-k>'] = { '<Esc>:m .-2<CR>==gi', 'Move line up' },
    ['<leader>'] = {
        ['q'] = {'<cmd>q<CR>', 'Safe quit'},
        ['Q'] = {'<cmd>q!<CR>', 'Quit'},
        ['w'] = {'<cmd>w<CR>', 'Save current buffer'},
        ['e'] = {'<cmd>e!<CR>', 'Reload buffer'},
        ['r'] = {'<cmd>wq<CR>', 'Save then exit'},
        ['x'] = {'<cmd>bd<CR>', 'Safe close buffer'},
        ['X'] = {'<cmd>bd!<CR>', 'Close buffer'},
        ['/'] = {'<cmd>set hlsearch!<CR>', 'Toggle search highlight'},
        p = {
            name = 'Plugins',
            c = { '<cmd>PackerCompile<CR>', 'Compile' },
            i = { '<cmd>PackerInstall<CR>', 'Install' },
            s = { '<cmd>PackerStatus<CR>', 'Status' },
            S = { '<cmd>PackerSync<CR>', 'Sync' },
            u = { '<cmd>PackerUpdate<CR>', 'Update' }
        }
    }
})

-- visual mode [v]
wk.register({
    ['<'] = { '<gv', 'Reduce indent level' },
    ['>'] = { '>gv', 'Increase indent level' },
    ['<M-j>'] = { ':m .+1<CR>==', 'Move line down' },
    ['<M-k>'] = { ':m .-2<CR>==', 'Move line up' },
}, { mode = 'v' })

-- visual_block mode [x]
wk.register({
    ['<M-j>'] = { ':move \'>+1<CR>gv-gv', 'Move line down' },
    ['<M-k>'] = { ':move \'<-2<CR>gv-gv', 'Move line up' },
}, { mode = 'x' })
