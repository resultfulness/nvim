return {
  'folke/zen-mode.nvim',
  config = function()
    vim.keymap.set('n', '<leader>z', function()
      require('zen-mode').toggle({
        window = {
          options = {
            signcolumn = 'no'
          }
        },
        plugins = {
          alacritty = {
            enabled = true,
          }
        }
      })
    end, { desc = '[Z]en Mode' })
  end
}
