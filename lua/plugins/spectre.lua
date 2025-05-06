return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set("n", "<leader>sr", function()
      require("spectre").open()
    end, { desc = "Replace in files (Spectre)" })
  end,
}
