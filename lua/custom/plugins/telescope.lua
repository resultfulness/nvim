return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    -- enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    local b = require('telescope.builtin')

    vim.keymap.set('n', '<leader>?', b.help_tags, { desc = 'Help' })
    vim.keymap.set('n', '<leader><space>', b.buffers, { desc = 'Open buffers' })
    vim.keymap.set('n', '<leader>sf', b.find_files, { desc = 'Filesys: Search files' })
    vim.keymap.set('n', '<C-p>', b.git_files)
    vim.keymap.set('n', '<leader>ss', b.live_grep, { desc = 'Filesys: Search string' })
  end
}

