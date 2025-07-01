local servers = {
    lua = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                telemetry = { enable = false },
            }
        }
    },
    typescript = {
        cmd = { 'typescript-language-server', '--stdio' },
        filetypes = { 'typescript', 'javascript' },
        root_markers = { 'package.json' }
    },
    rust = {
        cmd = { 'rust-analyzer' },
        filetypes = { 'rust' },
        root_markers = { 'Cargo.toml' }
    },
    qmlls = {
        cmd = { '/usr/lib/qt6/bin/qmlls', '-E' },
        filetypes = { 'qml' }
    },
    -- html = {
    --     cmd = { 'vscode-html-language-server', '--stdio' },
    --     filetypes = { 'html' },
    --     init_options = {
    --         provideFormatter = true,
    --         embeddedLanguages = { css = true, javascript = true },
    --         configurationSection = { 'html', 'css', 'javascript' },
    --     },
    -- },
    css = {
        cmd = { 'vscode-css-language-server', '--stdio' },
        filetypes = { 'css' },
    },
    emmet = {
        cmd = { '/home/alice/.local/share/pnpm/emmet-language-server', '--stdio' },
        filetypes = { 'html', 'css' },
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

for server_name in pairs(servers) do
    servers[server_name].capabilities = capabilities
    vim.lsp.config[server_name] = servers[server_name]
    vim.lsp.enable(server_name)
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function (event)
        vim.keymap.set('n', '<f2>', vim.lsp.buf.rename, { buffer = event.buf, desc = 'rename' })
        vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'code action' })
        vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, { buffer = event.buf, desc = 'show references' })
        vim.keymap.set('n', 'grt', require('telescope.builtin').lsp_type_definitions, { buffer = event.buf, desc = 'goto type' })
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, { buffer = event.buf })
        vim.keymap.set('n', 'K', function () vim.lsp.buf.hover({
            border = "rounded"
        }) end, { buffer = event.buf })

        -- create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(
            event.buf,
            'Format',
            function () vim.lsp.buf.format() end,
            { desc = 'format current buffer' }
        )

        -- highlight occurrences of word under cursor
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup( 'lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
                end,
            })

        end
    end
})

vim.diagnostic.config({ virtual_text = true })
