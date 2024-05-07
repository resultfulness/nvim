return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function (bufnr)
            local gs = require('gitsigns')
            vim.keymap.set('n', '[g', gs.prev_hunk, { buffer = bufnr })
            vim.keymap.set('n', ']g', gs.next_hunk, { buffer = bufnr })
            vim.keymap.set('n', '<leader>g', gs.preview_hunk, { buffer = bufnr })
        end,
    },
}
