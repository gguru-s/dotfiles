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
                -- borderchars = {
                --     prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                --     results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                --     preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                -- },
                --
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
        })

        pcall(require("telescope").load_extension, "fzf")

        local keymap = vim.keymap
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzz find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find files in buffer" })
    end,
}
