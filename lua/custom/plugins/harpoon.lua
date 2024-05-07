return {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim'
    },
    config = function()
        local h = require('harpoon')
        h:setup({})

        vim.keymap.set('n', '<leader>ha', function() h:list():append() end, { desc = 'Harpoon: Add file' })
        vim.keymap.set('n', '<leader>hh', function() h.ui:toggle_quick_menu(h:list()) end, { desc = 'Harpoon: Open menu' })
        vim.keymap.set('n', '<leader>hn', function() h:list():next() end, { desc = 'Harpoon: Next mark' })
        vim.keymap.set('n', '<leader>hp', function() h:list():prev() end, { desc = 'Harpoon: Previous mark' })

        for i = 1, 9, 1 do
            vim.keymap.set('n', string.format('<leader>h%s', i), function() h:list():select(i) end, { desc = 'Harpoon: Go to mark ' .. i});
        end
    end
}
