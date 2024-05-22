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

        vim.keymap.set('n', '<leader><leader>', b.resume)
        vim.keymap.set('n', '<leader>?', b.help_tags)
        vim.keymap.set('n', '<leader>b', b.buffers)
        vim.keymap.set('n', '<leader>sf', b.find_files)
        vim.keymap.set('n', '<C-p>', b.git_files)
        vim.keymap.set('n', '<leader>/', b.live_grep)
        vim.keymap.set('n', '<leader>sg', b.git_status)
    end
}
