local pluginKeys = {}

-- 设定映射函数
-- set map function
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local wk = require("which-key")

-- basic operation for write and quit
-- 文件写入退出基本操作
wk.register({
	["<Leader>s"] = { ":w!<CR>", "Save File" },
	["<Leader>q"] = { ":qa<CR>", "Quit All" },
	["<Leader>S"] = { ":wa<CR>", "Save All" },
})

-- lsp 回调快捷键设置
pluginKeys.maplsp = function(mapbuf)
	-- go xx
	mapbuf("n", "]d", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	-- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "]D", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	mapbuf("n", "]i", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	mapbuf("n", "]r", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	-- diagnostic
	mapbuf("n", "]p", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	mapbuf("n", "]n", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	mapbuf("n", "]a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	mapbuf("n", "]h", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
end

-- code related
-- 代码相关
map("n", ",", ":Jaq<CR>", opt)

-- markdown related
-- markdown 相关
wk.register({
	["<Leader>m"] = { ":MarkdownPreview<CR>", "Markdown preview" },
})

-- git related
-- git 相关
wk.register({
	["<Leader>g"] = { ":LazyGit<CR>", "Open lazygit" },
})
-- file related
-- 文件相关操作
wk.register({
	["<Leader><Tab>"] = { "<C-^>", "Last file" },
})

wk.register({
	["<Leader>f"] = {
		name = "+File",
		p = { ":Telescope projects<CR>", "Open project" },
		r = { ":Telescope oldfiles<CR>", "Recent files" },
		b = { ":Telescope file_browser<CR>", "File browser" },
		n = { ":AdvancedNewFile<CR>", "New file" },
		s = { ":Telescope live_grep<CR>", "Search in project" },
		f = { ":Telescope find_files<CR>", "Search file" },
	},
})

-- jk map to esc
-- jk映射为esc键
map("i", "jk", "<Esc>", opt)

-- window operate by which-key
-- 窗口操作(使用which-key快捷键设置)
wk.register({
	["<Leader>w"] = {
		name = "+Window",
		h = { "<C-w>h", "To left" },
		j = { "<C-w>j", "To up" },
		k = { "<C-w>k", "To down" },
		l = { "<C-w>l", "To right" },
		s = { ":sp<CR>", "Split window" },
		v = { ":vsplit<CR>", "Vsplit window" },
		d = { ":close<CR>", "Close window" },
		o = { ":only<CR>", "Close others" },
	},
})

-- base operation for visual mode
-- 可视模式下基本操作
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- neoTree
map("n", "T", ":NeoTreeFocusToggle<CR>", opt)

-- Packer
wk.register({
	["<Leader>p"] = {
		name = "+Packer",
		i = { ":PackerSync<CR>", "PackerSync" },
		s = { ":PackerStatus<CR>", "PackerStatus" },
		c = { ":PackerClean<CR>", "PackerClean" },
	},
})

-- Bufferline and buffer related
wk.register({
	["<Leader>b"] = {
		name = "+Buffer",
		k = { ":bd!<CR>", "Kill buffer" },
		o = { ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", "Close other buffer" },
		b = { ":Telescope buffers<CR>", "Open buffers" },
		n = { ":ls<CR>", "Buffer numbers" },
		c = { ":noh<CR>", "Cancel highlight" },
		C = { ":call setqflist([], 'r')<CR>", "Clear quickfix" },
		q = { ":copen<CR>", "Open quickfix" },
		s = { ":Telescope current_buffer_fuzzy_find<CR>", "Searching in buffer" },
	},
})
wk.register({
	["<Leader>j"] = { ":HopLineStart<CR>", "Quick jump line" },
})

-- 快速切换主题
wk.register({
	["<Leader>c"] = { ":Telescope colorscheme<CR>", "Quick change colortheme" },
})
map("n", "<Tab>", "za", opt)
-- insert 模式下ctrl a e跳转开头结尾
map("i", "<C-a>", "<C-o>I", opt)
map("i", "<C-e>", "<C-o>A", opt)

-- change left and right tab
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("i", "<C-h>", "<C-o>:BufferLineCyclePrev<CR>", opt)
map("i", "<C-l>", "<C-o>:BufferLineCycleNext<CR>", opt)

-- Mason
wk.register({
	["<Leader>l"] = {
		name = "+Lsp",
		i = { ":LspInstall<CR>", "Install lsp" },
		I = { ":MasonInstall ", "Install any" },
		r = { ":LspRestart<CR>", "Lsp restart" },
		m = { ":Mason<CR>", "Mason info" },
		u = { ":MasonUninstall<CR>", "Uninstall lsp" },
		U = { ":MasonUninstallAll<CR>", "Unistall all" },
		l = { ":LspInfo<CR>", "Lsp infos" },
		R = { vim.lsp.buf.rename, "Buffer var rename" },
	},
})

-- cmpeletion keys
-- 补全快捷键
pluginKeys.cmp = function(cmp)
	return {
		-- next option
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				require("luasnip").expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }), -- 下一个

		["<Up>"] = cmp.mapping.select_prev_item(),

		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
	}
end

-- dap keymaps
wk.register({
	["<Leader>d"] = {
		name = "+Debug",
		r = { ":lua require('dap').continue()<CR>", "Start debug" },
		b = { ":lua require('dap').toggle_breakpoint()<CR>", "Set breakpoint" },
		c = { ":lua require('dap').clear_breakpoints()<CR>", "Clear breakpoint" },
		e = {
			":lua require'dap'.close()<CR>"
				.. ":lua require'dap'.terminate()<CR>"
				.. ":lua require'dap.repl'.close()<CR>"
				.. ":lua require'dapui'.close()<CR>"
				.. ":DapVirtualTextDisable<CR>"
				.. "<C-w>o<CR>",
			"Stop debug",
		},
	},
})
map("i", "<C-d>", ":lua require'dap'.continue()<CR>", opt)
map("n", "<C-n>", ":lua require'dap'.step_into()<CR>", opt)
map("n", "<C-o>", ":lua require'dap'.step_over()<CR>", opt)

-- set keymap based on file type
vim.cmd("autocmd FileType * lua SetKeybinds()")
function SetKeybinds()
	local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
	local opts = { prefix = "<localleader>", buffer = 0 }

	if fileTy == "markdown" then
		wk.register({
			["t"] = { ":InsertNToc<CR>", "Insert table of content" },
			["d"] = { ":HeaderDecrease<CR>", "All header decrease" },
			["i"] = { ":HeaderIncrease<CR>", "All header increase" },
		}, opts)
	elseif fileTy == "python" then
		wk.register({
			["r"] = { ":MagmaEvaluateOperator<CR>", "Jupyter evaluate" },
			["c"] = { ":MagmaEvaluateCell<CR>", "Jupyter evaluate cell" },
		}, opts)
		-- elseif fileTy == "sh" then
		-- 	wk.register({
		-- 		["W"] = { ":w<CR>", "test write" },
		-- 		["Q"] = { ":q<CR>", "test quit" },
		-- 	}, opts)
	end
end
return pluginKeys
