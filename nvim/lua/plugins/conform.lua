require("conform").setup({
	notify_on_error = false,
	-- format_on_save = {
	--   timeout_ms = 500,
	--   lsp_format = 'fallback',
	-- },
	format_on_save = false,
	formatters = {
		prettier = {
			prepend_args = function()
				return { "--tab-width", "4", "--config-precedence", "prefer-file" }
			end,
		},
		prisma = {
			command = "bunx",
			args = { "prisma", "format", "--schema", "$FILENAME" },
			stdin = false,
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		php = { "pint" },
		rust = { "rustfmt" },
		kotlin = { "ktlint" },
		go = { "gofmt" },
		prisma = { "prisma" },
		["*"] = { "prettier" },
	},
})

-- Format keymap
vim.keymap.set("", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })
