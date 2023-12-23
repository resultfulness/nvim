return {
  -- Theme inspired by Atom
  'neanias/everforest-nvim',
  version = false,
  lazy = false,
  priority = 1000,
  config = function () vim.cmd.colorscheme('everforest') end
}
