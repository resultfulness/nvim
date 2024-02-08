return {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim'
    },
    config = function()
        local h = require('harpoon')
        h:setup({})

        vim.keymap.set("n", "<leader>a", function()
            h:list():append()
        end, { desc = "Harpoon: Add file to harpoon" })

        vim.keymap.set("n", "<C-h>", function()
            h.ui:toggle_quick_menu(h:list())
        end, { desc = "Harpoon: Open menu" })

        vim.keymap.set("n", "<C-j>", function() h:list():select(1) end);
        vim.keymap.set("n", "<C-k>", function() h:list():select(2) end);
        vim.keymap.set("n", "<C-l>", function() h:list():select(3) end);

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set('n', '<leader>h', function()
            toggle_telescope(h:list())
        end, { desc = 'Harpoon: Show mark list' })
    end
}
