return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "rust", "typescript", "c_sharp", "css", "vue" },
      sync_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = false },
    })
  end
}
