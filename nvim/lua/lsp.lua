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
			runtime = { version = "LuaJIT" }, -- Tell it you're using Neovim's Lua
			workspace = {
				-- Only index the Neovim API and your config, not every single plugin
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library" -- Optional: if you need libuv types
				},
				checkThirdParty = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	filetypes = { "lua" },
})

vim.lsp.config("pyright", {
	root_markers = { "pyproject.toml", "setup.py" },
	filetypes = { "python" },
})

vim.lsp.config("html", {
	filetypes = { "html" },
	root_markers = { "index.html", "package.json" },
})

vim.lsp.config("cssls", {
	filetypes = { "css", "scss", "less" },
	root_markers = {  "index.html" ,"package.json"  },
})

vim.lsp.config("emmet_ls", {
	filetypes = { "html", "css", "scss", "vue", "javascriptreact", "typescriptreact" },
	root_markers = { "package.json", "index.html" },
})

vim.lsp.config("tailwindcss", {
	filetypes = { "html", "css", "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	root_markers = { "tailwind.config.js", "tailwind.config.ts" }, -- only attach in tailwind projects
})

vim.lsp.config("ltex_plus", {
	filetypes = { "markdown", "tex", "text" }, -- don't let it attach to code files
})
vim.lsp.config("intelephense", {
	filetypes = { "php" },
})
vim.lsp.enable({
	"ts_ls",
	"pyright",
	"clangd",
	"lua_ls",
	"intelephense",
	-- "ltex_plus",
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
