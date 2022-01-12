local good = PREQ(true, 'alpha')
if not good[1] then error() end

local h = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
local date = h:read('*a')
h:close()

local variety
math.randomseed(os.time())
local chance = math.random(1, 100)
if chance < 20 then
    variety = require('dashboard.theme2').get(date)
else
    variety = require('dashboard.theme1').get(date)
end

local function setup(alpha)
    local header = {
        type = 'text',
        val = variety.header,
        opts = { position = 'center', hl = 'AlphaHeader' }
    }

    local heading1 = {
        type = 'text',
        val = variety.heading1,
        opts = {
            position = 'center',
            hl = 'AlphaHeading',
        }
    }

    local heading2 = {
        type = 'text',
        val = variety.heading2,
        opts = {
            position = 'center',
            hl = 'AlphaHeading',
        }
    }

    local function button(sc, txt, keybind)
        local sc_ = sc:gsub('%s', ''):gsub('SPC', '<leader>')

        local opts = {
            position = 'center',
            text = txt,
            shortcut = sc,
            cursor = 24,
            width = 24,
            align_shortcut = 'right',
            hl_shortcut = 'AlphaShortcut',
            hl = 'AlphaButtons',
        }
        if keybind then
            opts.keymap = {'n', sc_, keybind, {noremap = true, silent = true}}
        end

        return {
            type = 'button',
            val = txt,
            on_press = function()
                local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
                vim.api.nvim_feedkeys(key, 'normal', false)
            end,
            opts = opts,
        }
    end

    local buttons = {
        type = 'group',
        val = {
            button( 'e', '  New File',     '<cmd>ene<CR>'),
            button( 'f', '  Find File',    '<cmd>Telescope find_files<CR>' ),
            button( 'r', '  Recent Files', '<cmd>Telescope oldfiles<CR>' ),
            button( 'q', '  Quit!',        '<cmd>qall!<CR>')
        },
        opts = { spacing = 1 }
    }

    local q_tbl = require('dashboard.fortune')()
    local quote = {}
    local source
    for i, x in pairs(q_tbl) do
        if i ~= 1 then
            if string.match(x, "^%s%s+%-*") then source = x
            else table.insert(quote, x) end
        end
    end
    if source ~= nil then local _ = table.remove(quote) end

    local footer1 = {
        type = 'text',
        val = quote,
        opts = {
            position = 'center',
            hl = 'AlphaQuote'
        }
    }

    local footer2 = {
        type = 'text',
        val = source or '',
        opts = {
            position = 'center',
            hl = 'AlphaSource'
        }
    }

    local section = {
        header = header,
        heading1 = heading1,
        heading2 = heading2,
        buttons = buttons,
        footer1 = footer1,
        footer2 = footer2
    }

    local opts = {
        layout = {
            { type = 'padding', val = 1 },
            section.header,
            { type = 'padding', val = 1 },
            section.heading1,
            section.heading2,
            { type = 'padding', val = 2 },
            section.buttons,
            { type = 'padding', val = 1 },
            section.footer1,
            { type = 'padding', val = 1 },
            section.footer2
        },
        opts = { margin = 5 }
    }

    alpha.setup(opts)
end

setup(good[2])
