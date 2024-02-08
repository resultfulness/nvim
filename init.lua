vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- package manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({ { import = 'custom.plugins' } }, {})

require('custom.settings')
require('custom.keymaps')

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- highlight trailing whitespace
vim.cmd.match('SpellRare /\\s\\+$/')

require('custom.lsp')
require('custom.cmp')
