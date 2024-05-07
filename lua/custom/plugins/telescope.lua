return {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function() return vim.fn.executable 'make' == 1 end,
        },
    },
    config = function()
        require('telescope').setup({
            extensions = {
                ['ui-select'] = { require('telescope.themes').get_dropdown() }
            }
        })

        -- enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local b = require('telescope.builtin')

        vim.keymap.set('n', '<leader>?', b.help_tags, { desc = 'Help' })
        vim.keymap.set('n', '<leader><leader>', b.buffers, { desc = 'Open buffers' })
        vim.keymap.set('n', '<leader>sf', b.find_files, { desc = 'Filesys: Search files' })
        vim.keymap.set('n', '<C-p>', b.git_files)
        vim.keymap.set('n', '<leader>sg', b.live_grep, { desc = 'Filesys: Search by grep' })
        vim.keymap.set('n', '<leader>gs', b.git_status, { desc = 'Git: Status' })
        vim.keymap.set('n', '<leader>ss', b.resume, { desc = 'Filesys: Resume search' })
    end
}
