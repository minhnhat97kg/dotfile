return {
	"nvimdev/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = true,
			},
			code_action_prompt = {
				enable = true,
				sign = true,
			},
			implement = {
				enable = true,
				sign = true,
			},
		})

		vim.keymap.set("n", "<leader>tt", "<cmd>Lspsaga term_toggle<Cr>", { desc = "Floating terminal" })
		vim.keymap.set("t", "<leader>tt", "<cmd>Lspsaga term_toggle<Cr>", { desc = "Floating terminal" })
		vim.keymap.set({ "n", "v" }, "<leader>sf", "<cmd>Lspsaga finder<Cr>", { desc = "lspsaga finder" })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
