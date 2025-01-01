return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- lsp loading preview
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function ()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function (event)
                local map_n = function (mapping, fn, desc)
                    vim.keymap.set('n', mapping, fn, { buffer = event.buf, desc = desc })
                end

                map_n('<leader>rn', vim.lsp.buf.rename, 'rename')
                map_n('<f2>', vim.lsp.buf.rename, 'rename')
                map_n('<leader>.', vim.lsp.buf.code_action, 'code action')
                map_n('<C-.>', vim.lsp.buf.code_action, 'code action')

                map_n('gd', vim.lsp.buf.definition, 'goto definition')
                map_n('gI', vim.lsp.buf.implementation, 'goto implementation')
                map_n('gr', require('telescope.builtin').lsp_references, 'show references')
                map_n('<leader>D', vim.lsp.buf.type_definition, 'goto type')
                map_n('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'show outline')

                map_n('K', vim.lsp.buf.hover, 'show hover info')
                map_n('gD', vim.lsp.buf.declaration, 'goto declaration')

                vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help, { desc = 'show signature info' })

                -- create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(
                    event.buf,
                    'Format',
                    function (_) vim.lsp.buf.format() end,
                    { desc = 'format current buffer' }
                )

                -- highlight occurrences of word under cursor
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
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
                        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                        end,
                    })

                end
            end
        })

        -- server options
        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }

        -- nvim-cmp additional completion capabilities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        require('mason').setup()
        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            function (server_name)
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end
        })
    end
}
