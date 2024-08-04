-- misc plugins
return {
    -- detects tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    {
        'mbbill/undotree',
        config = function ()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'open undotree' })
        end
    },

    { 'numToStr/Comment.nvim', opts = {} },
    {
        'norcalli/nvim-colorizer.lua',
        config = function () require('colorizer').setup() end
    },
    { 'windwp/nvim-autopairs', opts = {} },
    { 'kylechui/nvim-surround', opts = {} },

    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
        },
    },
    { 'Bilal2453/luvit-meta', lazy = true },

    {
        'folke/which-key.nvim',
        event = 'VimEnter',
        config = function()
            require('which-key').setup()
        end
    }
}
