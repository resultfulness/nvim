return {
    "anAcc22/sakura.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
        vim.opt.background = "dark"
        vim.cmd('colorscheme sakura')
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        -- remove italics
        for _, value in pairs({"CursorLineNr", "Comment", "String", "Type"}) do
            vim.cmd.hi(value .. " gui=none")
        end
    end
}
