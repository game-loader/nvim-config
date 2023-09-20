local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` users.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` users.
			-- vim.fn["UltiSnips#Anon"](args.body)

			-- For `snippy` users.
			-- require'snippy'.expand_snippet(args.body)
		end,
	},
	-- 来源
	sources = cmp.config.sources({
		{ name = "orgmode" },
		{ name = "nvim_lsp" },
		{ name = "omni" },
		-- For vsnip users.
		-- { name = "vsnip" },
		-- For luasnip users.
		{ name = "luasnip" },
		--For ultisnips users.
		-- { name = 'ultisnips' },
		-- -- For snippy users.
		-- { name = 'snippy' },
	}, { { name = "buffer" }, { name = "path" } }),

	-- 快捷键
	mapping = require("keybindings").cmp(cmp),
	-- 使用lspkind-nvim显示类型图标
	formatting = {
		format = lspkind.cmp_format({
			with_text = true, -- do not show text alongside icons
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			before = function(entry, vim_item)
				-- Source 显示提示来源
				vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
				return vim_item
			end,
		}),
	},
	experimental = { ghost_text = true },
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- 浮窗参数提示
local signature_config = {
	debug = true,
	hint_enable = false,
	handler_opts = { border = "single" },
	max_width = 80,
}

require("lsp_signature").setup(signature_config)

-- 补全时自动添加括号
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- use friendly snippet
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
