return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	cmd = "Telescope",
	lazy = false,
	config = function(_, opts)
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						["i"] = {
							-- your custom insert mode mappings
						},
						["n"] = {
							-- your custom normal mode mappings
						},
					},
				},
			},
		})
		-- you need to call load_extension, somewhere after setup function:
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("rest")
		--- telescope.load_extension("fzf")
		local builtin = require("telescope.builtin")
		local utils = require("telescope.utils")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find file" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope lsp references" })
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope lsp references" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
		vim.keymap.set("n", "<leader>ft", builtin.buffers, { desc = "Telescope buffers" })

		vim.keymap.set(
			"v",
			"<leader>fg",
			"y<ESC>:Telescope live_grep default_text=<c-r>0<CR>",
			{ desc = "Telescope live grep" }
		)
		-- first load extension
		vim.keymap.set("n", "<leader>rn", function()
			require("telescope").extensions.rest.select_env()
		end, { desc = "Telescope rest select_env" })

		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = utils.buffer_dir() })
		end, { desc = "Find files in cwd" })
		vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
		-- open file_browser with the path of the current buffer
		vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

		-- -- Alternatively, using lua API
		-- vim.keymap.set("n", "<space>fb", function()
		--   require("telescope").extensions.file_browser.file_browser()
		-- end)
	end,
}
