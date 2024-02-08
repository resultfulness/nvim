return {
    -- detects tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- lsp
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- lsp loading preview
            { 'j-hui/fidget.nvim',       opts = {} },

            -- additional lua configuration
            'folke/neodev.nvim',
        },
    },

    -- autocompletion
    {
        'hrsh7th/nvim-cmp',
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
    },

    -- native fzf if installed
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end,
    },

    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree: Open undotree' })
        end
    },

    { 'numToStr/Comment.nvim',  opts = {} },
    {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    },
    { 'windwp/nvim-autopairs',  opts = {} },
    { 'kylechui/nvim-surround', opts = {} },
}
