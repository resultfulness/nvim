return {
    'theprimeagen/refactoring.nvim',
    config = function ()
        require('refactoring').setup({
            show_success_message = true,
        })
        vim.keymap.set({'n', 'x'}, '<leader>rr', ':Refactor ')
        vim.keymap.set({'n', 'x'}, '<leader>rd', require('refactoring').debug.print_var)
        vim.keymap.set('n', '<leader>rc', require('refactoring').debug.cleanup)
        vim.keymap.set('n', '<leader>rp', require('refactoring').debug.printf)
    end
}
