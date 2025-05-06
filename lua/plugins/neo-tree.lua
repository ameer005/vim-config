return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,

  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,          -- Allow toggling hidden files
          hide_dotfiles = false,   -- Show dotfiles like .env, .gitignore
          hide_gitignored = false, -- Show gitignored files
        },
      },
    })
    vim.keymap.set('n', '<C-e>', ':Neotree toggle left<CR>', {})
    vim.cmd([[
      highlight NeoTreeNormal guibg=NONE ctermbg=NONE
      highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
      highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
      highlight NeoTreeWinSeparator guibg=NONE ctermbg=NONE
  ]])
  end
}
