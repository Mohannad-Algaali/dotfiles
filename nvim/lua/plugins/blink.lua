require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "fallback" },
		["<C-y>"] = { "select_and_accept", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-e>"] = { "cancel", "fallback" },
	},
	completion = {
		accept = { auto_brackets = { enabled = false } },
		list = { selection = { preselect = false, auto_insert = false } },
		documentation = { auto_show = true },
		trigger = {
			show_on_keyword = true,
			show_on_trigger_character = true,
			show_on_insert_on_trigger_character = true,
			show_on_accept_on_trigger_character = true,
		},
	},
	sources = {
		default = { "lsp", "path", "buffer" },
	},

})
-- Replace cmp_nvim_lsp capabilities with blink's:
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})
