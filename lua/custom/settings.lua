vim.o.guicursor = ''

-- allows finding files in current directory recursively using :fin/gf
vim.o.path = vim.o.path .. '**'

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- disable mouse
vim.o.mouse = ''

vim.o.wrap = false

vim.o.undofile = true

vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 8
vim.wo.signcolumn = 'yes'

vim.o.termguicolors = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.opt.colorcolumn = '80'

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
