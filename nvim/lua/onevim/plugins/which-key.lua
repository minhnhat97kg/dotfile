return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require("which-key")
    -- As an example, we will create the following mappings:
    --  * <leader>ff find files
    --  * <leader>fr show recent files
    --  * <leader>fb Foobar
    -- we'll document:
    --  * <leader>fn new file
    --  * <leader>fe edit file
    -- and hide <leader>1

    wk.register({
      t = {
        name = "+Toggle", -- optional group name
        -- f = { "<cmd>Telescope find_files<cr>", "Find File" },                                 -- create a binding with label
        -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123 }, -- additional options for creating the keymap
        -- n = { "New File" },                                                                   -- just a label. don't create any mapping
        -- e = "Edit File",                                                                      -- same as above
        -- ["1"] = "which_key_ignore",                                                           -- special label to hide it in the popup
        o = { "<cmd>Lspsaga outline<cr>", "Outline" },
        g = { "<cmd>LazyGit<cr>", "LazyGit" },
      },
      ["."] = { "<cmd>Telescope resume<cr>", "Resume last telescope command" },
      -- Copilot chat commands
    }, { prefix = "<leader>", mode = { "n", "v" } })
  end,
}
