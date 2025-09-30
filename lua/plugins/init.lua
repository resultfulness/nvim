return {
    -- detects tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    {
        'mbbill/undotree',
        config = function ()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'open undotree' })
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function () require('colorizer').setup() end
    },
    { 'windwp/nvim-autopairs', opts = {} },
    { 'kylechui/nvim-surround', opts = {} },
    { 'folke/which-key.nvim', event = 'VimEnter', opts = {} },
    {
        'theprimeagen/refactoring.nvim',
        opts = {
            show_success_message = true,
        }
    },
}
