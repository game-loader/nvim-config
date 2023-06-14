require("mason").setup({
  ensure_installed = {"black", "stylua","clang-format","gofmt","styler", "eslint_d", "jq"},
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = { "lua_ls", "clangd", "pyright" },
})

