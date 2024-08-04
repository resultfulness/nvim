local keymaps = {
    { 'n', '<leader>st', vim.cmd.Ex, { desc = 'directory browser' }},

    { 'v', 'J', [[:m '>+1<CR>gv=gv]], { desc = 'move visual selection up' }},
    { 'v', 'K', [[:m '<-2<CR>gv=gv]], { desc = 'move visual selection up' }},

    { 'n', 'J', 'mzJ`z', { desc = 'join lines keeping cursor in place' }},

    -- center on cursor on common actions
    { 'n', '<C-d>', '<C-d>zz' },
    { 'n', '<C-u>', '<C-u>zz' },
    { 'n', 'n', 'nzz' },
    { 'n', 'N', 'Nzz' },

    { 'x', '<leader>p', [["_dP]], { desc = 'paste without copying' }},
    { { 'n', 'v' }, '<leader>d', [["_d]], { desc = 'delete without copying' }},

    { { 'n', 'v' }, '<leader>y', [["+y]], { desc = 'yank to system clipboard' }},
    { 'n', '<leader>Y', [["+Y]], { desc = 'yank line to system clipboard' }},

    { 'n', '<leader>f', vim.lsp.buf.format, { desc = 'format buffer' }},

    { 'n', '<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]], { desc = 'change all occurrences of word under cursor' }},

    { 'n', '<leader>X', '<cmd>!chmod +x %<cr>', { desc = 'mark current file as executable', silent = true }},

    { 'n', '[d', vim.diagnostic.goto_prev, { desc = 'previous diagnostic' }},
    { 'n', ']d', vim.diagnostic.goto_next, { desc = 'next diagnostic' }},
    { 'n', '<leader>e', vim.diagnostic.open_float, { desc = 'show diagnostic message' }},
    { 'n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostic list' }},
}

for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3], keymap[4] or {});
end


