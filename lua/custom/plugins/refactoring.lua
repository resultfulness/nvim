return {
    'theprimeagen/refactoring.nvim',
    opts = {},
    config = function()
        vim.keymap.set({ 'n', 'x' }, '<leader>rr', require('telescope').extensions.refactoring.refactors,
            { desc = 'Refactoring: Select refactor from list' })

        local function refactrmap(mode, key_suffix, refactor_name, desc)
            vim.keymap.set(mode, '<leader>r' .. key_suffix, function()
                require('refactoring').refactor(refactor_name)
            end, { desc = 'Refactoring: ' .. desc })
        end

        refactrmap({ 'n', 'x' }, 'i', 'Inline Variable', 'Inline variable')
        refactrmap('x', 'e', 'Extract Function', 'Extract function')
        refactrmap('x', 'f', 'Extract Function To File', 'Extract function to file')
        refactrmap('x', 'v', 'Extract Variable', 'Extract variable')
        refactrmap('n', 'e', 'Extract Block', 'Extract block')
        refactrmap('n', 'f', 'Extract Block To File', 'Extract block to file')
    end
}
