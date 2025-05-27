--[[ vim.opt.clipboard = "unnamedplus" ]]
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.relativenumber = true

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>p', "\"_dp", { noremap = true, silent = true })


-- changing colour of lines and active cursor
vim.opt.cursorline = true

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Softer cyan for normal line numbers
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#66cccc", bg = "NONE" })

    -- Faded red-orange for the current line number
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9966", bold = true })

    -- Remove background highlight from the current line
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e2c2c" })
  end,
})

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
