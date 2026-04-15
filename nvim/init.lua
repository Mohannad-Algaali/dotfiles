vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH
vim.pack.add({
	-- Core plugins
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/oil.nvim",
	{ src = "https://github.com/mason-org/mason.nvim", name = "mason" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", name = "telescope" },

	-- formatting
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform" },

	-- UI plugins
	{ src = "https://github.com/echasnovski/mini.nvim", name = "mini" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "ibl" },
	"https://github.com/folke/which-key.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },

	-- Typst plugins
	{ src = "https://github.com/kaarmu/typst.vim", name = "typst.vim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim", name = "preview" },
	{ src = "https://github.com/Myriad-Dreamin/tinymist", name = "tinymist" },

	-- Completion plugins
	{ src = "https://github.com/Saghen/blink.cmp", name = "blink" },
	{ src = "https://github.com/exafunction/codeium.vim", name = "codeium" },
	{ src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" },

	-- Rest Client plugins
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/rest-nvim/rest.nvim",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/nvim-treesitter/nvim-treesitter",

	-- love2d
	"https://github.com/S1M0N38/love2d.nvim",

	-- dbee

	{ src = "https://github.com/MunifTanjim/nui.nvim", name = "nui" },
	{ src = "https://github.com/kndndrj/nvim-dbee", name = "dbee" },
})

require("options")
require("keymaps")
require("theme")
require("lsp")

require("plugins.oil")
require("plugins.telescope")
require("plugins.mini")
require("plugins.indent_line")
require("plugins.conform")
require("plugins.rest")
require("plugins.dbee")

require("plugins.blink")

require("typst-preview").setup()

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:find("mimetypes") or msg:find("xml2lua") then
		return
	end
	notify(msg, ...)
end

