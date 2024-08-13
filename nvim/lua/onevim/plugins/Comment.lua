return {
  "numToStr/Comment.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  keys = {
    { "gcc", mode = "n",          desc = "Comment toggle current line" },
    { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n",          desc = "Comment toggle current block" },
    { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
  },
  config = function(_, opts)
    require("Comment").setup(opts)
    require("Comment").setup({
      pre_hook = function(ctx)
        -- Only calculate commentstring for tsx filetypes
        if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" then
          local U = require("Comment.utils")

          -- Determine whether to use linewise or blockwise commentstring
          local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

          -- Determine the location where to calculate commentstring from
          local location = nil
          if ctx.ctype == U.ctype.blockwise then
            location = require("ts_context_commentstring.utils").get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
          end

          return require("ts_context_commentstring.internal").calculate_commentstring({
            key = type,
            location = location,
          })
        end
      end,
    })
  end,
}
