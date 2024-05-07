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

        vim.keymap.set('n', '<leader>a', function () h:list():append() end)
        vim.keymap.set('n', '<C-g>', function () h.ui:toggle_quick_menu(h:list()) end)

        vim.keymap.set('n', '<C-h>', function () h:list():select(1) end)
        vim.keymap.set('n', '<C-t>', function () h:list():select(2) end)
        vim.keymap.set('n', '<C-n>', function () h:list():select(3) end)
        vim.keymap.set('n', '<C-s>', function () h:list():select(4) end)
        vim.keymap.set('n', '<leader><C-h>', function () h:list():replace_at(1) end)
        vim.keymap.set('n', '<leader><C-t>', function () h:list():replace_at(2) end)
        vim.keymap.set('n', '<leader><C-n>', function () h:list():replace_at(3) end)
        vim.keymap.set('n', '<leader><C-s>', function () h:list():replace_at(4) end)
    end
}
