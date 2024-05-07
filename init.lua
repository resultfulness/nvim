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

require('custom.settings')
require('custom.keymaps')

require('lazy').setup({ { import = 'custom.plugins' } }, {})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function ()
        vim.highlight.on_yank()
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
})
