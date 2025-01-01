return {
    'catppuccin/nvim',
    version = false,
    lazy = false,
    priority = 1000,
    config = function ()
        require('catppuccin').setup({
            color_overrides = {
                mocha = {
                    text = "#f4cde9",
                    subtext1 = "#debad4",
                    subtext0 = "#c8a6be",
                    overlay2 = "#b293a8",
                    overlay1 = "#9c7f92",
                    overlay0 = "#866c7d",
                    surface2 = "#705873",
                    surface1 = "#5a455d",
                    surface0 = "#443145",

                    base = "#352939",
                    mantle = "#211924",
                    crust = "#1a1016",
                }
            }
        })
        vim.cmd.colorscheme('catppuccin')
    end
}
