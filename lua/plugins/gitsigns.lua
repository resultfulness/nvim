return {
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
}
