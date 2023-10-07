vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set({ 'n', 'v', 'i' }, '<C-e>', vim.cmd.Rex)

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew' })

vim.keymap.set('n', '<leader>pt', ":25Lex<CR>", { desc = '[P]roject [T]ree' })
vim.keymap.set('n', '<C-b>', ":25Lex<CR>")

-- quick lazy
vim.keymap.set('n', '<leader>Ls', ":Lazy sync<CR>", { desc = '[L]azy [s]ync' })
vim.keymap.set('n', '<leader>Lr', ":Lazy reload ", { desc = '[L]azy [r]eload' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- move visual selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place when [J]oining lines
vim.keymap.set("n", "J", "mzJ`z")

-- center on cursor on common actions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = '[P]aste without copying replaced' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = '[Y]ank to system clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = '[Y]ank line to system clipboard' })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = '[D]elete without copying' })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat current buffer" })

vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubstitute word under cursor" })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Mark file as e[x]ecutable' })

vim.keymap.set("v", "<leader>mt", ":!pandoc -t markdown-simple_tables<CR>", { silent = true, desc = '[M]arkdown: Format [T]able'})
--
-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

