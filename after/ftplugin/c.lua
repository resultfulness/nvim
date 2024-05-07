function ToggleHFile()
    local fn = vim.fn.expand('%')
    local ext = fn:sub(-2)
    if ext == '.c' then
        vim.cmd.e(vim.fn.expand('%:r') .. '.h')
    elseif ext == '.h' then
        vim.cmd.e(vim.fn.expand('%:r') .. '.c')
    else
        print('not a .c/.h file!')
    end
end

vim.api.nvim_buf_set_keymap(vim.api.nvim_get_current_buf(), 'n', '<leader>c', ':lua ToggleHFile()<cr>', { desc = "Toggle between .c and .h file", silent = true, noremap = true })
