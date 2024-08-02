return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'nvim-telescope/telescope.nvim',
    'j-hui/fidget.nvim',
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    on_attach = (function(client, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      --vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>kf', function()
        vim.lsp.buf.format { async = true }
      end, { buffer = bufnr })

      vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references, opts)
      vim.keymap.set("n", 'gd', require('telescope.builtin').lsp_definitions, opts)
      vim.keymap.set("n", 'gI', require('telescope.builtin').lsp_implementations, opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

      -- vim.keymap.set("n", '<leader>D', require('telescope.builtin').lsp_type_definitions, opts)

      -- Diagnostic keymaps
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
      vim.diagnostic.config ({
        float = { border = "rounded" }
      })

      -- doesnt update the floatboarder for everyting
      -- vim.api.nvim_set_hl(0, 'FloatBorder', {fg='#9a8d7a'})
    end)

    -- require('lspconfig.ui.windows').default_options = {
    --   border = "rounder"
    -- }

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { 'tsserver', 'rust_analyzer', 'clangd', 'volar', 'lua_ls', 'omnisharp' },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end,

        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          })
        end,

        clangd = function()
          require('lspconfig').clangd.setup({
            on_attach = function(client, bufnr)
              client.server_capabilities.signatureHelpProvider = false
              on_attach(client, bufnr)
            end,
            capabilities = capabilities,
          })
        end,
      }
    })
  end,
}
