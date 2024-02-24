return {
    -- detects tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

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
