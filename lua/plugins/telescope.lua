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
            cond = function () return vim.fn.executable 'make' == 1 end,
        },
    },
    config = function ()
        require('telescope').setup({
            extensions = {
                ['ui-select'] = { require('telescope.themes').get_dropdown() }
            }
        })

        -- enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local b = require('telescope.builtin')

        vim.keymap.set('n', '<leader>sc', b.resume, { desc = 'continue last search' })
        vim.keymap.set('n', '<leader>?', b.help_tags, { desc = 'search help' })
        vim.keymap.set('n', '<leader>b', b.buffers, { desc = 'search buffers' })
        vim.keymap.set('n', '<leader>sf', b.find_files, { desc = 'search files' })
        vim.keymap.set('n', '<C-p>', b.git_files, { desc = 'search git files' })
        vim.keymap.set('n', '<leader>/', b.live_grep, { desc = 'search for string in files' })
        vim.keymap.set('n', '<leader>sg', b.live_grep, { desc = 'search for string in files' })
        vim.keymap.set('n', '<leader>gs', b.git_status, { desc = 'show git status' })
    end
}
