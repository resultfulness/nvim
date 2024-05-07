return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- nvim stuff
        'folke/neodev.nvim',

        -- lsp loading preview
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function ()
        local on_attach = function (_, bufnr)
            local map_n = function (mapping, fn)
                vim.keymap.set('n', mapping, fn, { buffer = bufnr })
            end

            map_n('<leader>r', vim.lsp.buf.rename)
            map_n('<f2>', vim.lsp.buf.rename)
            map_n('<leader>.', vim.lsp.buf.code_action)
            map_n('<C-.>', vim.lsp.buf.code_action)

            map_n('gd', vim.lsp.buf.definition)
            map_n('gI', vim.lsp.buf.implementation)
            map_n('gr', require('telescope.builtin').lsp_references)
            map_n('<leader>ls', require('telescope.builtin').lsp_document_symbols)

            map_n('K', vim.lsp.buf.hover)
            map_n('gD', vim.lsp.buf.declaration)

            vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help)

            -- create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(
                bufnr,
                'Format',
                function (_) vim.lsp.buf.format() end,
                { desc = 'Format current buffer' }
            )
        end

        -- server options
        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }

        require('neodev').setup()

        -- nvim-cmp additional completion capabilities
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        require('mason').setup()
        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            function (server_name)
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end
        })
    end
}
