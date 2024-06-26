-- misc plugins
return {
    -- detects tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    {
        'mbbill/undotree',
        config = function ()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
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
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {}
    }
}
