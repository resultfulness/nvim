return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "A",
            modified  = "M",
            deleted   = "D",
            renamed   = "R",
            untracked = "U",
            ignored   = "I",
            unstaged  = "",
            staged    = "S",
            conflict  = "C",
          }
        }
      },
      window = {
        position = 'right'
      },
      filesystem = {
        hijack_netrw_behavior = 'disabled'
      }
    }
    vim.keymap.set({'n', 'x', 'i'}, '<C-b>', function ()
      if vim.bo.filetype ~= 'neo-tree' then
        vim.cmd('Neotree right')
      else
        vim.cmd('Neotree close')
      end
    end)
  end,
}
