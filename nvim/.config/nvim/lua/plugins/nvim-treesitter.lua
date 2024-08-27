return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "javascript", "html", "rust", "typescript", "c_sharp", "css", "vue", "markdown", "markdown_inline" },
      sync_install = false,
      highlight =
      {
        enable = true,
        additional_vim_regex_highlighting = { "markdown", "markdown_inline" }
      },
      indent = { enable = false },
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end
}
