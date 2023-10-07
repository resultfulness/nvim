return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = function ()
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'css', 'go', 'html', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim' },

        auto_install = false,

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        textobjects = {
          swap = {
            enable = true,
            swap_next = {
              ['<leader>la'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>lA'] = '@parameter.inner',
            },
          },
        },
      }
    end, 0)
  end
}
