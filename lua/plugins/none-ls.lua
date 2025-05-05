return {

  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
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
  end
}
