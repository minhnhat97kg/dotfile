return {
  "nvim-tree/nvim-tree.lua",
  keys = {},
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
    require("nvim-tree").setup()
    -- empty setup using defaults
  end,
  lazy = false,
}
