return {
  'akinsho/bufferline.nvim',
  version = "*",
  config = function()
    require("bufferline").setup {}

    vim.keymap.set("n", "<leader>x", "<CMD>bdelete<CR>", {})
    vim.keymap.set("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
  end
}
