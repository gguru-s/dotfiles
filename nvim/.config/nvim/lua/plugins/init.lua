return {
    "tpope/vim-sleuth",
    { "numToStr/Comment.nvim", opts = {} },
    {
        "szw/vim-maximizer",
        keys = {
            { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
        },
    },
}
