local s_ok = PREQ(true, 'surround')
if not s_ok[1] then
    CONFIG_GOOD = false
    table.insert(CONFIG_ERRORS, { name = 'syntax', msg = 'failed to load surround!' })
else
    s_ok[2].setup { mappings_style = 'sandwich' }
end

local ts_ok = PREQ(true, 'nvim-treesitter.configs')
if not ts_ok[1] then error('failed to load treesitter!') end
local ts_conf = ts_ok[2]

ts_conf.setup {
    ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'css',
        'dockerfile',
        'fish',
        'go',
        'html',
        'javascript',
        'json',
        'latex',
        'lua',
        'make',
        'markdown',
        'perl',
        'php',
        'python',
        'rasi',
        'regex',
        'rust',
        'scss',
        'toml',
        'typescript',
        'vim',
        'yaml'
    },
    autopairs = { enable = true },
    highlight = {
        enable = true,
        disable = { 'toml' }
    },
    indent = { enable = true }
}
vim.cmd('set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()')

local ibl_ok = PREQ(true, 'indent_blankline')
if ibl_ok[1] then
    local ibl = ibl_ok[2]
    ibl.setup {
        char_list = { '|', '¦', '┆', '┊' },
        use_treesitter = true,
        show_trailing_blankline_indent = false,
        show_foldtext = true,
        filetype_exclude = {
            'help',
            'dashboard',
            'packer',
            'neogitstatus',
            'NvimTree',
            'Trouble',
        },
        buftype_exclude = { 'terminal', 'nofile' },
        bufname_exclude = { 'README.md' },
        show_current_context = true,
        context_char = '┃',
        context_patterns = {
            'class',
            'return',
            'function',
            'method',
            '^if',
            '^while',
            'jsx_element',
            '^for',
            '^object',
            '^table',
            'block',
            'arguments',
            'if_statement',
            'else_clause',
            'jsx_element',
            'jsx_self_closing_element',
            'try_statement',
            'catch_clause',
            'import_statement',
            'operation_type'
        }
    }
else
    CONFIG_GOOD = false
    table.insert(CONFIG_ERRORS, { name = 'syntax', msg = 'failed to load indent_blankline!' })
end

local c_ok = PREQ(true, 'Comment')
if not c_ok then error('failed to load Comment!') end
c_ok[2].setup {}
