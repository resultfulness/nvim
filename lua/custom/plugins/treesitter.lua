return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    config = function ()
        vim.defer_fn(function ()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'c', 'css', 'html', 'lua', 'python', 'rust', 'javascript', 'typescript', 'vimdoc', 'vim' },
                auto_install = false,
                sync_install = false,
                ignore_install = {},
                modules = {},
                highlight = { enable = true },
                indent = { enable = true },
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<leader>]'] = { query = '@parameter.inner' },
                        },
                        swap_previous = {
                            ['<leader>['] = { query = '@parameter.inner' },
                        },
                    },
                },
            })
        end, 0)
    end
}
