return {
  "phaazon/hop.nvim",
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection
    vim.keymap.set("", "f", function()
      hop.hint_char1({ current_line_only = false })
    end, { remap = true })
  end,
}
