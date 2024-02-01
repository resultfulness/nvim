return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  build = ':TSUpdate',
  config = function ()
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'css', 'html', 'lua', 'python', 'rust', 'javascript', 'typescript', 'vimdoc', 'vim' },

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
              ['<leader>ln'] = { query = '@parameter.inner', desc = "LSP: Swap with next parameter" },
            },
            swap_previous = {
              ['<leader>lp'] = { '@parameter.inner', desc = "LSP: Swap with previous parameter" },
            },
          },
        },
      }
    end, 0)
  end
}
