local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- 每次自动选择null-ls作为formatter auto choose null-ls as formatter
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.clang_format,
		require("null-ls").builtins.formatting.gofmt,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.eslint_d,
		require("null-ls").builtins.formatting.jq,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
