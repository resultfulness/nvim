return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    config = function()
        vim.defer_fn(function()
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
                            ['<leader>ln'] = {
                                query = '@parameter.inner',
                                desc = 'LSP: Swap with next parameter'
                            },
                        },
                        swap_previous = {
                            ['<leader>lp'] = {
                                query = '@parameter.inner',
                                desc = 'LSP: Swap with previous parameter'
                            },
                        },
                    },
                },
            })
        end, 0)
    end
}
