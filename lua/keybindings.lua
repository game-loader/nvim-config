local pluginKeys = {}

-- 设定映射函数
-- set map function
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local wk = require("which-key")

-- basic operation for write and quit
-- 文件写入退出基本操作
wk.register({
	["<Leader>s"] = { ":w<CR>", "Save File" },
	["<Leader>q"] = { ":qa<CR>", "Quit All" },
	["<Leader>S"] = { ":wa<CR>", "Save All" },
})

-- code related
-- 代码相关
map("n", ",", ":RunCode<CR>", opt)

-- markdown related
-- markdown 相关
wk.register({
	["<Leader>m"] = { ":MarkdownPreview<CR>", "Markdown preview" },
})

-- markdown table
-- markdown 表格
wk.register({
	["<Leader>t"] = {
		name = "+Table",
	},
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
		n = { ":enew<CR>", "New file" },
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

--一般映射方式
--map("n", "<Leader>wh", "<C-w>h", opt)
--map("n", "<Leader>wj", "<C-w>j", opt)
--map("n", "<Leader>wk", "<C-w>k", opt)
--map("n", "<Leader>wl", "<C-w>l", opt)

-- base operation for visual mode
-- 可视模式下基本操作
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- nvimTree
map("n", "n", ":NvimTreeToggle<CR>", opt)

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
		b = { ":bp<CR>", "Last buffer" },
		n = { ":ls<CR>", "Buffer numbers" },
		t = { ":b ", "To buffer" },
	},
})
-- change left and right tab
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- Mason
wk.register({
	["<Leader>l"] = {
		name = "+Lsp",
		i = { ":LspInstall<CR>", "Install lsp" },
		I = { ":MasonInstall ", "Install any" },
		l = { ":Mason<CR>", "Mason info" },
		u = { ":MasonUninstall<CR>", "Uninstall lsp" },
		U = { ":MasonUninstallAll<CR>", "Unistall all" },
	},
})

-- Telescope
map("n", "f", ":Telescope find_files<CR>", opt)

-- cmpeletion keys
-- 补全快捷键
pluginKeys.cmp = function(cmp)
	return {
		-- next option
		-- 下一个
		["<Tab>"] = cmp.mapping.select_next_item(),
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
				.. ":lua require('dap').clear_breakpoints()<CR>"
				.. "<C-w>o<CR>",
			"Stop debug",
		},
	},
})
map("i", "<C-d>", ":lua require'dap'.continue()<CR>", opt)
map("n", "<C-n>", ":lua require'dap'.step_into()<CR>", opt)
map("n", "<C-o>", ":lua require'dap'.step_over()<CR>", opt)

return pluginKeys
