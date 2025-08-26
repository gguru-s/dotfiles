return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    opts = {
        options = {
            icons_enabled = true,
            theme = "gruvbox-material",
            -- component_separators = { left = "│", right = "│" },
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "windows" }, -- disable section a
            lualine_b = {}, -- disable section b
            lualine_c = {}, -- keep only section c
            lualine_x = {}, -- disable section x
            lualine_y = {}, -- disable section y
            lualine_z = { "location" }, -- disable section z
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "quickfix" },
    },
}
