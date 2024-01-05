return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    -- enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
    require('telescope').load_extension('harpoon')

    local b = require('telescope.builtin')

    vim.keymap.set('n', '<leader>?', b.help_tags, { desc = 'Help' })
    vim.keymap.set('n', '<leader><space>', b.buffers, { desc = 'Open buffers' })
    vim.keymap.set('n', '<leader>sf', b.find_files, { desc = 'Filesys: Search files' })
    vim.keymap.set('n', '<C-p>', b.git_files)
    vim.keymap.set('n', '<leader>sg', b.live_grep, { desc = 'Filesys: Search by grep' })
    vim.keymap.set('n', '<leader>gs', b.git_status, { desc = 'Git: Status'})
    vim.keymap.set('n', '<leader>h', ":Telescope harpoon marks<CR>", { desc = 'Harpoon: Show mark list' })
  end
}

