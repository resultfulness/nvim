return {
    'danymat/neogen',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local neogen = require('neogen')

        neogen.setup({ snippet_engine = 'luasnip' })

        vim.keymap.set('n', '<leader>n', neogen.generate, { desc = "Generate documentation boilerplate" })
    end,
}
