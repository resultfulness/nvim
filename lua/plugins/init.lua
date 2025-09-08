return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        version = false,
        lazy = false,
        priority = 1000,
        config = function ()
            require('rose-pine').setup({
                disable_background = true,
                styles = { italic = false },
            })
            vim.cmd.colorscheme('rose-pine-moon')
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    },
    -- detects tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    {
        'mbbill/undotree',
        config = function ()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'open undotree' })
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function () require('colorizer').setup() end
    },
    { 'windwp/nvim-autopairs', opts = {} },
    { 'kylechui/nvim-surround', opts = {} },
    { 'folke/which-key.nvim', event = 'VimEnter', opts = {} },
    {
        'stevearc/oil.nvim',
        config = function ()
            local oil = require('oil')
            oil.setup()
            vim.keymap.set('n', '<leader>st', oil.open, { desc = 'directory browser' })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = ''
            }
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = 'U' }
            },
            current_line_blame = true,
            on_attach = function (bufnr)
                local gs = require('gitsigns')
                vim.keymap.set('n', '[g', function () gs.nav_hunk('prev') end, { buffer = bufnr, desc = 'previous git change' })
                vim.keymap.set('n', ']g', function () gs.nav_hunk('next') end, { buffer = bufnr, desc = 'next git change' })
                vim.keymap.set('n', '<C-g>', gs.preview_hunk, { buffer = bufnr, desc = 'preview git change' })
            end,
        },
    },
    {
        'theprimeagen/refactoring.nvim',
        opts = {
            show_success_message = true,
        }
    },
}
