require("mason").setup({})

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.diagnostic.config({
	virtual_text = true, -- shows error at end of line
	virtual_lines = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		focusable = false,
		border = "rounded",
		source = true,
	},
})

vim.lsp.config("ts_ls", {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/usr/local/lib/node_modules/@vue/language-server",
				language = { "vue" },
			},
		},
	},
	filetypes = { "vue", "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_markers = { "package.json", "tsconfig.json" },
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			completion = { callSnippet = "Replace" },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("pyright", {
	root_markers = { "pyproject.toml", "setup.py" },
})

vim.lsp.config("intelephense", {
	root_markers = { "composer.json" },
})

vim.lsp.enable({
	"ts_ls",
	"pyright",
	"clangd",
	"lua_ls",
	"intelephense",
	"ltex_plus",
	"tinymist",
	"cssls",
	"html",
	"emmet_ls",
	"tailwindcss",

})

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		vim.lsp.completion.enable(true, args.data.client_id, args.buf, {
-- 			autotrigger = true,
-- 		})
-- 	end,
-- })
