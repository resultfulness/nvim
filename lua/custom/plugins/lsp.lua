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
    config = function()
        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc, prefix)
                if desc and prefix then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>lr', vim.lsp.buf.rename, 'Rename', true)
            nmap('<f2>', vim.lsp.buf.rename)
            nmap('<leader>lc', vim.lsp.buf.code_action, 'Code action', true)
            nmap('<C-.>', vim.lsp.buf.code_action)

            nmap('gd', vim.lsp.buf.definition, 'Goto definition')
            nmap('gr', require('telescope.builtin').lsp_references, 'Goto references')
            nmap('gI', vim.lsp.buf.implementation, 'Goto implementation')
            nmap('<leader>ld', vim.lsp.buf.type_definition, 'Type definition', true)
            nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document symbols', true)
            nmap('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace symbols', true)

            nmap('K', vim.lsp.buf.hover, 'Hover documentation')
            vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature help' })

            nmap('gD', vim.lsp.buf.declaration, 'Goto declaration')

            -- create a command `:format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer' })
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
            function(server_name)
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
