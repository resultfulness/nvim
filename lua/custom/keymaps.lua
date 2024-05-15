local keymaps = {
    -- directory browser
    { 'n', '<leader>st', vim.cmd.Ex },

    -- move visual selection up and down
    { 'v', 'J', [[:m '>+1<CR>gv=gv]] },
    { 'v', 'K', [[:m '<-2<CR>gv=gv]] },

    -- keep cursor in place when joining lines
    { 'n', 'J', 'mzJ`z' },

    -- center on cursor on common actions
    { 'n', '<C-d>', '<C-d>zz' },
    { 'n', '<C-u>', '<C-u>zz' },
    { 'n', 'n', 'nzz' },
    { 'n', 'N', 'Nzz' },

    -- paste over without copyting (greatest remap ever)
    { 'x', '<leader>p', [["_dP]] },
    -- delete without copying
    { { 'n', 'v' }, '<leader>d', [["_d]] },

    -- yanking to system clipboard (next greatest remap ever : asbjornHaland)
    { { 'n', 'v' }, '<leader>y', [["+y]] },
    { 'n', '<leader>Y', [["+Y]] },

    -- formatting
    { 'n', '<leader>F', vim.lsp.buf.format },

    -- change all occurences of word under cursor
    { 'n', '<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]] },

    -- mark as executable
    { 'n', '<leader>X', '<cmd>!chmod +x %<cr>', { silent = true } },

    -- diagnostics
    -- previous
    { 'n', '[d', vim.diagnostic.goto_prev },
    -- next
    { 'n', ']d', vim.diagnostic.goto_next },
    -- expand diagnostic message
    { 'n', '<leader>e', vim.diagnostic.open_float },
    -- open list
    { 'n', '<leader>q', vim.diagnostic.setloclist },
}

for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3], keymap[4] or {});
end


