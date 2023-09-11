-- simple, zero/minimal config plugins go here
-- bigger plugins necessitate a separate file
return {
  { 'mbbill/undotree', config = function ()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo Tree Toggle" })
  end
  },
  { 'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end },
  { 'windwp/nvim-autopairs', opts = {} },
  { 'kylechui/nvim-surround', opts = {} },
  { 'folke/trouble.nvim', opts = {}, config = function()
      vim.keymap.set("n", "<f8>", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
    end
  },
  { 'DaikyXendo/nvim-material-icon', config = function ()
      local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
      if not web_devicons_ok then
        return
      end

      local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
      if not material_icon_ok then
        return
      end

      web_devicons.setup({
        override = material_icon.get_icons(),
      })
    end,
  },
  {
    "gukz/ftFT.nvim",
    keys = { "f", "t", "F", "T" },
    config = function ()

      vim.g.ftFT_hl_group = "VisualNOS"
      vim.g.ftFT_sight_hl_group = "AerialLine"

      vim.g.ftFT_sight_enable = nil

      require("ftFT").setup()
    end
  }
}
