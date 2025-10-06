return {

  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local none_ls = require("null-ls")

    local formatting = none_ls.builtins.formatting
    local diagnostics = none_ls.builtins.diagnostics
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    none_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
          end,
        }),
        require("none-ls.code_actions.eslint_d"),
        formatting.stylua,
        formatting.prettier,

        -- Go sources
        formatting.gofmt,     -- Basic Go formatting
        formatting.goimports, -- Formatting + optimizing imports
        diagnostics.golangci_lint.with({
          condition = function(utils)
            return utils.root_has_file({ ".golangci.yml", ".golangci.yaml", ".golangci.toml", ".golangci.json" })
          end,
        }),

        formatting.prismaFmt,

      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          -- Clear existing autocmds for this buffer in the group
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          -- Set format-on-save
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,

    })


    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {})
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
    })
  end
}
