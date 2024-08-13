-- return { "catppuccin/nvim", name = "catppuccin", priority = 1000 }

return {
	"navarasu/onedark.nvim", -- Theme
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("onedark").setup({
			style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = false, -- Show/hide background
		})
		vim.cmd("colorscheme onedark")
	end,
}
