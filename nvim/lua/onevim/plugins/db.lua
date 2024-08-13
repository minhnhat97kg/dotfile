return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod",                     lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.keymap.set("n", "<Leader>td", "<cmd>DBUIToggle<Cr>", { desc = "Toggle DB UI" })
  end,
  config = function()
    vim.keymap.set("n", "<Leader>td", "<cmd>DBUIToggle<Cr>", { desc = "Toggle DB UI" })
  end,
}
