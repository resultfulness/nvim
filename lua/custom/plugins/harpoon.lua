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

        vim.keymap.set('n', '<leader>a', function () h:list():add() end)
        vim.keymap.set('n', '<C-h>', function () h.ui:toggle_quick_menu(h:list()) end)

        vim.keymap.set('n', '<C-j>', function () h:list():select(1) end)
        vim.keymap.set('n', '<C-k>', function () h:list():select(2) end)
        vim.keymap.set('n', '<C-l>', function () h:list():select(3) end)
        vim.keymap.set('n', '<C-;>', function () h:list():select(4) end)
        vim.keymap.set('n', '<leader><C-j>', function () h:list():replace_at(1) end)
        vim.keymap.set('n', '<leader><C-k>', function () h:list():replace_at(2) end)
        vim.keymap.set('n', '<leader><C-l>', function () h:list():replace_at(3) end)
        vim.keymap.set('n', '<leader><C-;>', function () h:list():replace_at(4) end)
    end
}
