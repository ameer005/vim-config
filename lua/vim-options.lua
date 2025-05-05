vim.opt.clipboard = "unnamedplus"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.relativenumber = true

vim.api.nvim_create_augroup("TransparentBG", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = "TransparentBG",
  callback = function()
    local highlights = {
      "Normal",
      "NormalNC",
      "EndOfBuffer",
      "VertSplit",
      "SignColumn",
      "StatusLine",
    }
    for _, hl in ipairs(highlights) do
      vim.cmd("highlight " .. hl .. " ctermbg=none guibg=none")
    end
  end
})
