vim.opt.guicursor = ''

-- allows finding files in current directory recursively using :fin/gf
vim.opt.path = vim.o.path .. '**'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- disable mouse
vim.opt.mouse = ''

vim.opt.wrap = false

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.termguicolors = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = '80'

vim.opt.list = true
vim.opt.listchars = { tab = '› ', trail = '•', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
