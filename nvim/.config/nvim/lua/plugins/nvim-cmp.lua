return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    'rafamadriz/friendly-snippets',
    "onsails/lspkind.nvim",
  },
  config = function()

    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require 'luasnip'
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    require('luasnip.loaders.from_vscode').lazy_load()

    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    luasnip.config.setup {}

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        completion = {
          border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
          winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
        },
        documentation = {
          border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
          winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
        },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-l>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip', },
        -- { name = 'nvim_lua' },
        { name = 'buffer', },
        { name = 'path' },
      }),
      experimental = {
        -- ghost_text = true,
      },
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

  end
}
