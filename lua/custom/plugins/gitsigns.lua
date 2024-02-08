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
        on_attach = function(bufnr)
            local gs = require('gitsigns')
            vim.keymap.set('n', '<leader>gp', gs.prev_hunk, { buffer = bufnr, desc = 'Git: Go to previous hunk' })
            vim.keymap.set('n', '<leader>gn', gs.next_hunk, { buffer = bufnr, desc = 'Git: Go to next hunk' })
            vim.keymap.set('n', '<leader>gh', gs.preview_hunk, { buffer = bufnr, desc = 'Git: Preview hunk' })
        end,
    },
}
