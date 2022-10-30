return {
	on_setup = function(server)
		server.setup({
			flags = {
				debounce_text_changes = 150,
			},
			on_attach = function(client, bufnr)
				-- 禁用格式化功能，交给专门插件插件处理
				client.server_capabilities.document_formatting = false
				client.server_capabilities.document_range_formatting = false

				vim.api.nvim_create_autocmd("CursorHold", {
					buffer = bufnr,
					callback = function()
						local opts = {
							focusable = false,
							close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
							border = "rounded",
							source = "always",
							prefix = " ",
							scope = "cursor",
						}
						vim.diagnostic.open_float(nil, opts)
					end,
				})
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				-- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
				-- 绑定快捷键
				require("keybindings").maplsp(buf_set_keymap)
			end,
		})
	end,
}
