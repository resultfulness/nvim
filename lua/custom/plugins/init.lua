return {
  -- detects tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- lsp
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- lsp loading preview
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- additional lua configuration
      'folke/neodev.nvim',
    },
  },

  -- autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      'hrsh7th/cmp-nvim-lsp',

      -- customize cmp
      'onsails/lspkind.nvim',
    },
  },

  { 'numToStr/Comment.nvim', opts = {} },

  -- native fzf if installed
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree toggle" })
    end
  },

  { 'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end },

  { 'windwp/nvim-autopairs', opts = {} },

  { 'kylechui/nvim-surround', opts = {} },

  {
    'folke/trouble.nvim',
    opts = {},
    config = function()
      vim.keymap.set("n", "<f8>", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
    end
  },

  {
    'DaikyXendo/nvim-material-icon',
    config = function()
      local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
      if not web_devicons_ok then
        return
      end

      local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
      if not material_icon_ok then
        return
      end

      web_devicons.setup({ override = material_icon.get_icons() })
    end,
  },
}
