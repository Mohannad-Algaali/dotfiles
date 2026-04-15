
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>o", ":so<CR>", { desc = "Source current file" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete without yanking" })
vim.keymap.set({ "n", "v" }, "X", '"_X', { desc = "Delete backwards without yanking" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- vim.keymap.set('n', '<leader>e', ':Ex<CR>', { silent = true, desc = 'Open Netrw Explorer' })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- close all buffers except current one
vim.keymap.set("n", "<leader>cb", ":%bd|e#|bd#<CR>", { desc = "[C]lose all [B]uffers except current" })
vim.keymap.set("n", "<leader>ca", ":%bd<CR>", { desc = "[C]lose all [B]uffers " })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>e", ":Oil<CR>", { silent = true, desc = "Open Oil Explorer" })
vim.keymap.set("n", "<leader>rr", ":Rest run<CR>", { desc = "Run REST Under Cursor", silent = true })

vim.keymap.set("n", "<leader>sv", ":vsp<CR>", { desc = "[S]plit [V]ertical", silent = true })
vim.keymap.set("n", "<leader>sz", ":sp<CR>", { desc = "[S]Split Hori[z]ontal", silent = true })

-- vim.keymap.set("n", "<leader>v", {desc = "LÖVE" })
vim.keymap.set("n", "<leader>vv", "<cmd>LoveRun<,cr>", { desc = "Run LÖVE" })
vim.keymap.set("n", "<leader>vs", "<cmd>LoveStop<cr>", { desc = "Stop LÖVE" })

-- vim.keymap.set("n", "<leader>f", require("conform").format, {desc = "[F]ormat buffer" })

vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

local wk = require("which-key")
wk.setup({
	plugins = {
		spelling = {
			enabled = true,
			highlight = true,
		},
	},
})


wk.add({
  { "<leader>f", group = "Format buffer" },
  { "<leader>e", group = "Explorer" },
  { "<leader>r", group = "Run" },
  { "<leader>c", group = "Close" },
  { "<leader>v", group = "LÖVE" },
  { "<leader>b", group = "DBee" },
  { "<leader>s", group = "Search" },
})
