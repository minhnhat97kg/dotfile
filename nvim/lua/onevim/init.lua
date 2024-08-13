--======================================
--=            OPTION SECTION          =
--======================================
local opt = vim.opt
local g = vim.g

g.mapleader = " "

-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 1
opt.ruler = false
vim.opt.relativenumber = true

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

--======================================
--=           LAZY SECTION          =
--======================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ { import = "onevim.plugins" } }, {
  install = {
    colorscheme = { "nightfly" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
})

--======================================
--=           MAPPING SECTION          =
--======================================
g.mapleader = " "

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
-------------------------------------- commands ------------------------------------------
vim.keymap.set("n", "<Leader>sv", "<cmd>source $MYVIMRC<cr>", { desc = "Reload source nvim" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<Cr>", { desc = "Docs hover" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<Cr>", { desc = "Toggle NvTree" })
vim.keymap.set("n", ";", ":")

-- Buffer line
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<Cr>", { desc = "Move next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<Cr>", { desc = "Move prev buffer" })
vim.keymap.set("n", "<Leader>b", "<cmd>BufferLinePick<Cr>", { desc = "Move prev buffer" })

vim.keymap.set("v", "<Tab>", "<cmd>BufferLineCycleNext<Cr>", { desc = "Move next buffer" })
vim.keymap.set("v", "<S-Tab>", "<cmd>BufferLineCyclePrev<Cr>", { desc = "Move prev buffer" })
vim.keymap.set("v", "<Leader>b", "<cmd>BufferLinePick<Cr>", { desc = "Move prev buffer" })

vim.keymap.set("n", "<Leader>x", ":bd<Cr>", { desc = "Close buffer" })

-- Map all the keys
vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>lua require('copilot').toggle()<CR>", { desc = "Open Copilot Chat" })
-- map key explain
vim.keymap.set({ "n", "v" }, "<leader>cx", "<cmd>CopilotChatExplain<CR>", { desc = "Explain Copilot Chat" })
-- mpa key fix
vim.keymap.set({ "n", "v" }, "<leader>cf", "<cmd>CopilotChatFix<CR>", { desc = "Fix Copilot" })
-- map key ask
vim.keymap.set({ "n", "v" }, "<leader>cq", "<cmd>CopilotChatOptimize<CR>", { desc = "Optimize Copilot Chat" })

vim.keymap.set({ "n", "v" }, "<leader>cq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "Ask Copilot Chat" })
