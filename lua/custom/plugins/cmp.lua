return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        -- snippets
        {
            'L3MON4D3/LuaSnip',
            build = (function() return 'make install_jsregexp' end)(),
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'rafamadriz/friendly-snippets',

        -- customize cmp
        'onsails/lspkind.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        luasnip.config.setup()

        local cmp_icons = {
            Text = '  ',
            Method = '  ',
            Function = '  ',
            Constructor = '  ',
            Field = '  ',
            Variable = '  ',
            Class = '  ',
            Interface = '  ',
            Module = '  ',
            Property = '  ',
            Unit = '  ',
            Value = '  ',
            Enum = '  ',
            Keyword = '  ',
            Snippet = '  ',
            Color = '  ',
            File = '  ',
            Reference = '  ',
            Folder = '  ',
            EnumMember = '  ',
            Constant = '  ',
            Struct = '  ',
            Event = '  ',
            Operator = '  ',
            TypeParameter = '  ',
        }

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,noinsert,noselect'
            },
            window = {
                completion = {
                    side_padding = 0,
                },
            },
            formatting = {
                expandable_indicator = true,
                fields = { 'kind', 'abbr' },
                format = function(entry, vim_item)
                    local kind = require('lspkind').cmp_format({
                        mode = 'symbol',
                        maxwidth = 50,
                        symbol_map = cmp_icons
                    })(entry, vim_item)

                    -- surround icon with whitespace
                    local strings = vim.split(kind.kind, '%s', { trimempty = true })
                    kind.kind = ' ' .. (strings[1] or '') .. ' '

                    return kind
                end,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-y>'] = cmp.mapping.confirm({
                    select = true,
                }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            },
        })

        require('luasnip.loaders.from_snipmate').lazy_load()
        require('luasnip.loaders.from_vscode').lazy_load()

        -- clear snippet jumps on insert mode exit
        -- https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1429989436
        vim.api.nvim_create_autocmd('ModeChanged', {
            pattern = '*',
            callback = function()
                if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
                    and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
                    and not require('luasnip').session.jump_active
                then
                    require('luasnip').unlink_current()
                end
            end
        })
    end
}
