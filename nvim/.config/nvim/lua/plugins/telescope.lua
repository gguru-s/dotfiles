return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },

    config = function()
        local telescope = require("telescope")

        -- local border = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" }
        local border = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
        telescope.setup({
            path_display = { "smart" },
            defaults = {
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                    },
                },
                border = true,
                borderchars = {
                    prompt = border,
                    results = border,
                    preview = border,
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local keymap = vim.keymap
        local builtin = require("telescope.builtin")
        keymap.set("n", "<leader><space>", builtin.find_files, { desc = "[F]ind files" })
        keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind recent files" })
        keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
        keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
        keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
        keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })

        -- set telescope window colors
        local TelescopeColor = {
            TelescopeMatching = { fg = "#f2cdcd" },
            TelescopeSelection = { link = "PmenuSel" },
            -- TelescopeSelection = { fg = "#cdd6f4", bg = "#313244", bold = true },

            -- TelescopePromptPrefix = { bg = colors.background },
            -- TelescopePromptNormal = { bg = colors.background },
            -- TelescopeResultsNormal = { bg = colors.background },
            -- TelescopePreviewNormal = { bg = colors.background },
            TelescopePromptBorder = { bg = "none", fg = "#545454" },
            TelescopeResultsBorder = { bg = "none", fg = "#545454" },
            TelescopePreviewBorder = { bg = "none", fg = "#545454" },
            TelescopePromptTitle = { bg = "#333333", fg = "#cdd6f4" },
            TelescopeResultsTitle = { bg = "#333333", fg = "#cdd6f4" },
            TelescopePreviewTitle = { bg = "#333333", fg = "#cdd6f4" },
        }

        for hl, col in pairs(TelescopeColor) do
            vim.api.nvim_set_hl(0, hl, col)
        end
    end,
}
