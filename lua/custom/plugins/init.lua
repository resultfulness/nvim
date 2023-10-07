return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- LSP related
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      --customize cmp
      'onsails/lspkind.nvim',
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
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
  },
  {
    'lervag/vimtex',
    init = function ()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'tectonic'
      vim.g.tex_conceal = 'abdmg'
    end
  }
}
