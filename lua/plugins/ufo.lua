return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter",
  },
  event = "BufReadPost",
  config = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- never fold special buffers
        if buftype ~= "" then
          return nil
        end

        -- never fold plain text
        if filetype == "txt" then
          return nil
        end

        -- optional: exclude other non-code buffers
        if filetype == "markdown"
            or filetype == "help"
            or filetype == "neo-tree"
            or filetype == "NvimTree"
            or filetype == "oil"
        then
          return nil
        end

        return { "treesitter", "lsp" }
      end,
    })


    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  end,
}
