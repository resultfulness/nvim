return {
    'theprimeagen/refactoring.nvim',
    config = function ()
        require('refactoring').setup({
            show_success_message = true,
        })
        vim.keymap.set({'n', 'x'}, '<leader>R', ':Refactor ', { desc = 'refactor' })
        vim.keymap.set({'n', 'x'}, '<leader>Rd', require('refactoring').debug.print_var, { desc = 'debug print variable under cursor' })
        vim.keymap.set('n', '<leader>Rc', require('refactoring').debug.cleanup, { desc = 'clean up debug prints' })
        vim.keymap.set('n', '<leader>Rp', require('refactoring').debug.printf, { desc = 'debug print' })
    end
}
