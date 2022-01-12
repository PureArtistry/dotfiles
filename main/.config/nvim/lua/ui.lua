local bl_ok= PREQ(true, 'bufferline')
if bl_ok[1] then
    local bl = bl_ok[2]
    local function bl_diags()
        local r = {}

        local function l(t)
            local n = 0
            for _ in pairs(t) do n = n + 1 end
            return n
        end

        local server = vim.lsp.get_active_clients()
        local num = l(server)
        if num ~= 0 then
            local severities = {
                [1] = { severity = vim.diagnostic.severity.ERROR, text = '  ', color = FLAVOURS.base08 },
                [2] = { severity = vim.diagnostic.severity.WARN, text = '  ', color = FLAVOURS.base0E },
                [3] = { severity = vim.diagnostic.severity.INFO, text = '  ', color = FLAVOURS.base05 },
                [4] = { severity = vim.diagnostic.severity.HINT, text = '  ', color = FLAVOURS.base0C }
            }
            for i in pairs(server) do
                if vim.lsp.buf_is_attached(0, i) then
                    table.insert(r, { text = '   ' .. server[i].name .. ' ', guifg = FLAVOURS.base02 })
                    for j = 1,4,1 do
                        local n = l(vim.diagnostic.get(0, { severity = severities[j].severity }))
                        if n ~= 0 then
                            table.insert(r, { text = severities[j].text .. n, guifg = severities[j].color })
                        end
                    end
                end
            end
        end

        return r
    end

    local function bl_misc()
        local ro = vim.bo.readonly
        if not ro then return nil end
        return {{
            text = '  ',
            guifg = FLAVOURS.base08,
            guibg = 'none',
            gui = 'bold'
        }}
    end

    bl.setup {
        options = {
            numbers = 'none',
            right_mouse_command = nil,
            middle_mouse_command = 'bdelete! %d',
            indicator_icon = '▋',
            offsets = {{
                filetype = 'NvimTree',
                text = 'nvim-tree',
                highlight = 'BufferLineFileManager',
                text_align = 'center',
                -- padding = 1
            }},
            show_buffer_close_icons = false,
            show_close_icon = false,
            persist_buffer_sort = false,
            separator_style = { '▕', '▕' },
            sort_by = 'id',
            custom_areas = {
                left = function() return bl_misc() end,
                right = function() return bl_diags() end
            }
        },
        highlights = {
            fill = {
                guifg = 'none',
                guibg = 'none',
                gui = 'none'
            },
            background = {
                guifg = FLAVOURS.base02,
                guibg = 'none',
                gui = 'bold,italic'
            },
            buffer_visible = {
                guifg = FLAVOURS.base03,
                guibg = 'none',
                gui = 'bold,italic'
            },
            buffer_selected = {
                guifg = FLAVOURS.base07,
                guibg = 'none',
                gui = 'bold,italic'
            },
            -- info = {
            --     guifg = <color-value-here>,
            --     guisp = <color-value-here>,
            --     guibg = <color-value-here>
            -- },
            -- info_visible = {
            --     guifg = <color-value-here>,
            --     guibg = <color-value-here>
            -- },
            -- info_selected = {
            --     guifg = <color-value-here>,
            --     guibg = <color-value-here>,
            --     gui = "bold,italic",
            --     guisp = <color-value-here>
            -- },
            -- warning = {
            --     guifg = <color-value-here>,
            --     guisp = <color-value-here>,
            --     guibg = <color-value-here>
            -- },
            -- warning_visible = {
            --     guifg = <color-value-here>,
            --     guibg = <color-value-here>
            -- },
            -- warning_selected = {
            --     guifg = <color-value-here>,
            --     guibg = <color-value-here>,
            --     gui = "bold,italic",
            --     guisp = <color-value-here>
            -- },
            -- error = {
            --     guifg = <color-value-here>,
            --     guibg = <color-value-here>,
            --     guisp = <color-value-here>
            -- },
            -- error_visible = {
            --     guifg = <color-value-here>,
            --     guibg = <color-value-here>
            -- },
            -- error_selected = {
            --     guifg = <color-value-here>,
            --     guibg = <color-value-here>,
            --     gui = "bold,italic",
            --     guisp = <color-value-here>
            -- },
            -- modified = {
            --     guifg = '<color-value-here>',
            --     guibg = '<color-value-here>'
            -- },
            -- modified_visible = {
            --     guifg = '<color-value-here>',
            --     guibg = '<color-value-here>'
            -- },
            -- modified_selected = {
            --     guifg = '<color-value-here>',
            --     guibg = '<color-value-here>'
            -- },
            -- duplicate_selected = {
            --     guifg = '<color-value-here>',
            --     gui = "italic",
            --     guibg = '<color-value-here>'
            -- },
            -- duplicate_visible = {
            --     guifg = '<color-value-here>',
            --     gui = "italic",
            --     guibg = '<color-value-here>'
            -- },
            -- duplicate = {
            --     guifg = '<color-value-here>',
            --     gui = "italic",
            --     guibg = '<color-value-here>'
            -- },
            separator_selected = {
                guifg = FLAVOURS.base01,
                guibg = 'none'
            },
            separator_visible = {
                guifg = FLAVOURS.base01,
                guibg = 'none'
            },
            separator = {
                guifg = FLAVOURS.base01,
                guibg = 'none'
            },
            indicator_selected = {
                guifg = FLAVOURS.base09,
                guibg = 'none'
            },
            -- pick_selected = {
            --     guifg = '<color-value-here>',
            --     guibg = '<color-value-here>',
            --     gui = "bold,italic"
            -- },
            -- pick_visible = {
            --     guifg = '<color-value-here>',
            --     guibg = '<color-value-here>',
            --     gui = "bold,italic"
            -- },
            -- pick = {
            --     guifg = '<color-value-here>',
            --     guibg = '<color-value-here>',
            --     gui = "bold,italic"
            -- }
        }
    }
else
    CONFIG_GOOD = false
    table.insert(CONFIG_ERRORS, { name = 'ui', msg = 'failed to load bufferline!' })
end

local gl_ok= PREQ(true, 'galaxyline')
if not gl_ok[1] then error('failed to load galaxyline!') end
local gl = gl_ok[2]
local condition = require('galaxyline.condition')

local mode_color = function()
    local mode_colors = {
        [110] = FLAVOURS.base09,
        [105] = FLAVOURS.base0B,
        [99] = FLAVOURS.base02,
        [116] = FLAVOURS.base0D,
        [118] = FLAVOURS.base0E,
        [22] = FLAVOURS.base0E,
        [86] = FLAVOURS.base0E,
        [82] = FLAVOURS.base08,
        [115] = FLAVOURS.base08,
        [83] = FLAVOURS.base08
    }

    local color = mode_colors[vim.fn.mode():byte()]
    if color ~= nil then
        return color
    else
        return FLAVOURS.base0E
    end
end

gl.short_line_list = { 'NvimTree', 'alpha' }
local gls = gl.section

local i = 1
gls.left[i] = {
    ViMode = {
        provider = function()
            local aliases = {
                [110] = ' ' .. os.date('%H:%M'),
                [105] = 'INSERT',
                [99] = 'COMMAND',
                [116] = 'TERMINAL',
                [118] = 'VISUAL',
                [22] = 'V-BLOCK',
                [86] = 'V-LINE',
                [82] = 'REPLACE',
                [115] = 'SELECT',
                [83] = 'S-LINE'
            }
            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
            local alias = aliases[vim.fn.mode():byte()]
            local mode
            if alias ~= nil then
                mode = alias
            else
                mode = vim.fn.mode():byte()
            end
            return '  ' .. mode .. ' '
        end,
        highlight = { FLAVOURS.base07, 'NONE', 'bold' }
    }
}

local use_git = true
if next(CONFIG_ERRORS) ~= nil then
    for _, x in pairs(CONFIG_ERRORS) do
        if x.name == 'git' then use_git = false end
    end
end

if use_git then
    i = i + 1
    gls.left[i] = {
        GitIcon = {
            provider = function()
                return '  '
            end,
            condition = condition.check_git_workspace,
            separator = ' ',
            separator_highlight = { 'NONE', 'NONE' },
            highlight = { FLAVOURS.base04, 'NONE' }
        }
    }
    i = i + 1
    gls.left[i] = {
        GitBranch = {
            provider = 'GitBranch',
            condition = condition.check_git_workspace,
            separator = ' ',
            separator_highlight = { 'NONE', 'NONE' },
            highlight = { FLAVOURS.base04, 'NONE' }
        }
    }
    i = i + 1
    gls.left[i] = {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = condition.hide_in_width,
            icon = ' ',
            highlight = { FLAVOURS.base0B, 'NONE' }
        }
    }
    i = i + 1
    gls.left[i] = {
        DiffModified = {
            provider = 'DiffModified',
            condition = condition.hide_in_width,
            icon = ' ',
            highlight = { FLAVOURS.base0D, 'NONE' }
        }
    }
    i = i + 1
    gls.left[i] = {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = condition.hide_in_width,
            icon = ' ',
            highlight = { FLAVOURS.base08, 'NONE' }
        }
    }
end

local j = 1
gls.mid[j] = {
    DiagLine = {
        provider = function()
            local w = vim.fn.winwidth(0) - 80
            if w < 11 then w = 11 end
            local function msg(s)
                if string.len(s) < w then return s end
                return string.sub(s, 1, w - 3) .. '...'
            end

            local error = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
            if next(error) ~= nil then
                vim.api.nvim_command('hi GalaxyDiagLine guifg=' .. FLAVOURS.base08)
                vim.api.nvim_command('hi GalaxyDiagLine gui=bold')
                local pos = '[' .. error[1].lnum + 1 .. ':' .. error[1].col + 1 .. ']'
                return pos .. '   ' .. msg(error[1].message)
            end

            local warning = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
            if next(warning) ~= nil then
                vim.api.nvim_command('hi GalaxyDiagLine guifg=' .. FLAVOURS.base0E)
                vim.api.nvim_command('hi GalaxyDiagLine gui=bold')
                local pos = '[' .. warning[1].lnum + 1 .. ':' .. warning[1].col + 1 .. ']'
                return pos .. '   ' .. msg(warning[1].message)
            end

            local info = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
            if next(info) ~= nil then
                vim.api.nvim_command('hi GalaxyDiagLine guifg=' .. FLAVOURS.base05)
                vim.api.nvim_command('hi GalaxyDiagLine gui=none')
                local pos = '[' .. info[1].lnum + 1 .. ':' .. info[1].col + 1 .. ']'
                return pos .. '   ' .. msg(info[1].message)
            end

            local hint = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
            if next(hint) ~= nil then
                vim.api.nvim_command('hi GalaxyDiagLine guifg=' .. FLAVOURS.base0C)
                vim.api.nvim_command('hi GalaxyDiagLine gui=none')
                local pos = '[' .. hint[1].lnum + 1 .. ':' .. hint[1].col + 1 .. ']'
                return pos .. '   ' .. msg(hint[1].message)
            end
        end,
        condition = condition.check_active_lsp,
        highlight = { 'NONE', 'NONE', 'NONE' }
    }
}

local k = 1
gls.right[k] = {
    FileSize = {
        provider = 'FileSize',
        condition = function()
            local width = vim.fn.winwidth(0)
            if width > 100 then
                local tbl = { ['alpha'] = true, [''] = true }
                if tbl[vim.bo.filetype] then return false end
                return true
            end
            return false
        end,
        separator = '  ',
        separator_highlight = { FLAVOURS.base01, FLAVOURS.base01 },
        highlight = { FLAVOURS.base04, FLAVOURS.base01 }
    }
}
k = k + 1
gls.right[k] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = function()
            local width = vim.fn.winwidth(0)
            if width > 100 then
                local tbl = { ['alpha'] = true, [''] = true }
                if tbl[vim.bo.filetype] then return false end
                return true
            end
            return false
        end,
        separator = ' ',
        separator_highlight = { FLAVOURS.base01, FLAVOURS.base01 },
        highlight = { FLAVOURS.base04, FLAVOURS.base01 }
    }
}
k = k + 1
gls.right[k] = {
    TotalLines = {
        provider = function()
            return vim.fn.line('$') .. '  '
        end,
        condition = condition.hide_in_width,
        separator = '  ',
        separator_highlight = { FLAVOURS.base01, FLAVOURS.base01 },
        highlight = { FLAVOURS.base04, FLAVOURS.base01 }
    }
}
k = k + 1
gls.right[k] = {
    LineInfo = {
        provider = 'LineColumn',
        icon = ' ',
        separator = ' ',
        separator_highlight = { FLAVOURS.base02, FLAVOURS.base02 },
        highlight = { FLAVOURS.base05, FLAVOURS.base02, 'bold' }
    }
}
k = k + 1
gls.right[k] = {
    ScrollBar = {
        provider = 'ScrollBar',
        highlight = { FLAVOURS.base0F, FLAVOURS.base02, 'bold' }
    }
}

local function use_alt_line()
    if vim.bo.filetype == 'NvimTree' then return true end
    if vim.bo.filetype == 'alpha' then return true end
    return false
end

gls.short_line_left[1] = {
    Clock = {
        provider = function() return '  ' .. ' ' .. os.date('%H:%M') .. ' ' end,
        condition = function() return use_alt_line() end,
        highlight = { FLAVOURS.base07, FLAVOURS.base09, 'bold' }
    }
}
gls.short_line_left[2] = {
    Blank = {
        provider = function () return '' end,
        condition = function() return use_alt_line() end,
        highlight = { 'none', 'none', 'none' }
    }
}

local use_mpd
local mpd_h = io.popen('pgrep mpd', 'r')
local mpd_check = mpd_h:read("*l")
mpd_h:close()
if mpd_check == nil then use_mpd = false end
if use_mpd == nil then
    local mpc_h = io.popen('command -v mpc', 'r')
    local mpc_check = mpc_h:read("*l")
    mpc_h:close()
    if mpc_check == nil then use_mpd = false
    else use_mpd = true
    end
end

local function check_mpd(ret)
    if not use_mpd then return false end
    local h = io.popen('mpc current', 'r')
    local r = h:read("*l")
    h:close()
    if r ~= nil then
        if ret then return r else return true end
    end
    return false
end

gls.short_line_right[1] = {
    MiscInfo1 = {
        provider = function()
            local r = check_mpd(true)
            if r ~= false then return '     ' .. r .. '  ' end
        end,
        condition = function()
            if vim.bo.filetype ~= 'NvimTree' then return true end
            return false
        end,
        highlight = { FLAVOURS.base04, FLAVOURS.base01, 'none' }
    }
}
gls.short_line_right[2] = {
    MiscInfo2 = {
        provider = function()
            if check_mpd(false) then
                local h = io.popen('mpc status "%currenttime% (%totaltime%)"', 'r')
                local r = h:read("*l")
                h:close()
                return '    ' .. r .. ' '
            end
        end,
        condition = function()
            if vim.bo.filetype ~= 'NvimTree' then return true end
            return false
        end,
        highlight = { FLAVOURS.base05, FLAVOURS.base02, 'bold' }
    }
}
gls.short_line_right[3] = {
    MiscInfo3 = {
        provider = function()
            if check_mpd(false) then
                local h = io.popen('mpc status %percenttime%', 'r')
                local r = h:read("*l")
                h:close()
                r = r:gsub('%%', '')
                r = tonumber(r)

                local chars = {'__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██'}
                if r <= 1 then return chars[1]
                elseif r <= 5 then return chars[2]
                elseif r <= 12 then return chars[3]
                elseif r <= 22 then return chars[4]
                elseif r <= 33 then return chars[5]
                elseif r <= 50 then return chars[6]
                elseif r <= 66 then return chars[7]
                elseif r <= 80 then return chars[8]
                else return chars[9]
                end
            end
        end,
        condition = function()
            if vim.bo.filetype ~= 'NvimTree' then return true end
            return false
        end,
        highlight = { FLAVOURS.base0F, FLAVOURS.base02, 'bold' }
    }
}
