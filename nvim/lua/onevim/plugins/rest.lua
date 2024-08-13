return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = { "luarocks.nvim" },
  config = function()
    require("rest-nvim").setup({
      client = "curl",
      encode_url = false,
    })

    vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run Rest API" })
  end,
  lazy = false,
}
