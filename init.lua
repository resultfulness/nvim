vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('settings')
require('keymaps')

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function ()
        vim.highlight.on_yank()
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
})

-- package manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local ret = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. ret)
    end
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({ { import = 'plugins' } }, {})

require('lsp')
