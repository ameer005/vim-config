return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
  opts = {
    indent = { char = "┊" }, -- Dotted vertical line
    scope = { enabled = true },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#555555" })
  end,
}
