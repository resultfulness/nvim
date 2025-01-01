return {
    'theprimeagen/refactoring.nvim',
    config = function ()
        require('refactoring').setup({
            show_success_message = true,
        })
        vim.keymap.set('x', '<leader>re', ':Refactor extract ', { desc = 'extract to func' })
        vim.keymap.set('x', '<leader>rv', ':Refactor extract_var ', { desc = 'extract to var' })
        vim.keymap.set('x', '<leader>rf', ':Refactor extract_to_file ', { desc = 'extract to file' })
        vim.keymap.set('n', '<leader>ri', ':Refactor inline_func', { desc = 'inline func' })
        vim.keymap.set({'n', 'x'}, '<leader>rI', ':Refactor inline_var', { desc = 'inline var' })
        vim.keymap.set({'n', 'x'}, '<leader>rd', require('refactoring').debug.print_var, { desc = 'debug print variable under cursor' })
        vim.keymap.set('n', '<leader>rc', require('refactoring').debug.cleanup, { desc = 'clean up debug prints' })
        vim.keymap.set('n', '<leader>rp', require('refactoring').debug.printf, { desc = 'debug print' })
    end
}
