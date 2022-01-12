local gs_ok = PREQ(true, 'gitsigns')
if not gs_ok[1] then error('failed to load gitsigns!') end
local gs = gs_ok[2]

gs.setup {
    signs = {
        add          = { hl = 'GitSignsAdd'   , text = '▐', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = '▐', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '✘', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '✘', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '▐', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' }
    },
    signcolumn = true,
    numhl      = false,
    linehl     = false,
    word_diff  = false,
    watch_index = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
    },
    current_line_blame_formatter_opts = {
        relative_time = false
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },
}

local wk_ok = PREQ(true, 'which-key')
if not wk_ok[1] then error('failed to load which-key: no keymaps for gitsigns have been set!') end
local wk = wk_ok[2]

wk.register({
    g = {
        name = 'Git',
        j = { '<cmd>lua require "gitsigns".next_hunk()<CR>', 'Next hunk' },
        k = { '<cmd>lua require "gitsigns".prev_hunk()<CR>', 'Previous hunk' },
        l = { '<cmd>lua require "gitsigns".blame_line()<CR>', 'Blame (line)' },
        p = { '<cmd>lua require "gitsigns".preview_hunk()<CR>', 'Preview hunk' },
        r = { '<cmd>lua require "gitsigns".reset_hunk()<CR>', 'Reset hunk' },
        R = { '<cmd>lua require "gitsigns".reset_buffer()<CR>', 'Reset buffer' },
        s = { '<cmd>lua require "gitsigns".stage_hunk()<CR>', 'Stage hunk' },
        u = { '<cmd>lua require "gitsigns".undo_stage_hunk()<CR>', 'Undo stage hunk' },
        -- TODO: add telescope bindings
        d = { '<cmd>Gitsigns diffthis HEAD<CR>', 'Git diff' }
    }
}, { prefix = '<leader>' })
