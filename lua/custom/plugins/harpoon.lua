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

    vim.keymap.set("n", "<leader>a", function() h:list():append() end,
      { desc = "Harpoon: Add file to harpoon" })

    vim.keymap.set("n", "<C-h>", function() h.ui:toggle_quick_menu(h:list()) end,
      { desc = "Harpoon: Open menu" })

    vim.keymap.set("n", "<C-j>", function() h:list():select(1) end);
    vim.keymap.set("n", "<C-k>", function() h:list():select(2) end);
    vim.keymap.set("n", "<C-l>", function() h:list():select(3) end);
  end
}
