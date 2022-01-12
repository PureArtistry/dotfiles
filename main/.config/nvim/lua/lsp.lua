local lsp_ok = PREQ(true, 'lspconfig')
if not lsp_ok[1] then error('failed to load lspconfig!') end
local nvim_lsp = lsp_ok[2]

local signs = { Error = ' ', Warn = ' ', Info = ' ', Hint = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = false,
    -- update_in_insert = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'single',
        source = 'always',
        -- header = '',
        -- prefix = ''
    }
})

local function lsp_highlight(client)
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

local function lsp_keys(bufnr)
    local wk_ok = PREQ(true, 'which-key')
    if not wk_ok[1] then
        CONFIG_GOOD = false
        table.insert(CONFIG_ERRORS, { name = 'lsp', msg = 'failed to load which-key: no keymaps for lsp have been set!' })
        return
    end
    local wk = wk_ok[2]

    wk.register({
        ['<C-k>'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Show signature help' },
        ['gd'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Jump to definition' },
        ['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Jump to declaration' },
        ['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Jump to implementation' },
        ['gl'] = {
            '<cmd>lua vim.diagnostic.open_float({ border = "single" })<CR>',
            'Line diagnostics popup'
        },
        ['gr'] = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Jump to references' },
        ['K'] = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Show hover info' }
    }, { buffer = bufnr })
end

local on_attach = function(client, bufnr)
    lsp_highlight(client)
    lsp_keys(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_ok then
    capabilities = cmp_lsp.update_capabilities(capabilities)
end

local handlers = {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' }),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' })
}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers
}

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers
}

nvim_lsp.bashls.setup {
    filetypes = { 'sh', 'zsh' },
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers
}

local lls_paths = vim.split(package.path, ';')
table.insert(lls_paths, 'lua/?.lua')
table.insert(lls_paths, 'lua/?/init.lua')
nvim_lsp.sumneko_lua.setup {
    cmd = { 'lua-language-server', '-E', '/usr/share/lua-language-server/main.lua' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT', path = lls_paths },
            diagnostics = { globals = { 'vim' }},
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false }
        }
    },
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers
}
