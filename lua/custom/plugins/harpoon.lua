return {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim'
    },
    config = function ()
        local h = require('harpoon')
        h:setup({})

        vim.keymap.set('n', '<leader>a', function () h:list():add() end, { desc = 'add to harpoon' })
        vim.keymap.set('n', '<C-h>', function () h.ui:toggle_quick_menu(h:list()) end, { desc = 'show harpoon' })
    end
}
