vim.g.skip_ts_context_commentstring_module = true
vim.g.ts_context_commentstring_config = {
  tsx = {
    __default = "// %s",
    __multiline = "{/* %s */}",
  },
  jsx = {
    __default = "// %s",
    __multiline = "{/* %s */}",
  },
  js = {
    __default = "// %s",
    __multiline = "/* %s */",
  },
}

return {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    local utils = require("Comment.utils")
    require('Comment').setup({
      mappings = {
        basic = {
          ["gcc"] = "comment.toggle.linewise",
          ["gcb"] = "comment.toggle.blockwise",
        },
      },
      pre_hook = function(ctx)
        local U = utils
        local location = nil

        if ctx.ctype == U.ctype.block then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring({
          key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
          location = location,
        })
      end,
    })
  end
}
