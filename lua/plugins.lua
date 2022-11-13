return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- lua 调试
	use("rafcamlet/nvim-luapad")
	------------------ themes --------------------------
	-- Nova theme for neovim light
	-- use({
	-- 	"zanglg/nova.nvim",
	-- 	config = function()
	-- 		-- support both dark and light style
	-- 		require("nova").setup({ background = "light" })

	-- 		-- load colorscheme
	-- 		require("nova").load()
	-- 	end,
	-- })
	use("rmehri01/onenord.nvim")

	use({
		"navarasu/onedark.nvim",
	})

	use("savq/melange")

	-----------------------------------------------------------------------------------------

	-- a good terminal
	-- 一个好的nvim内终端
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- make live command
	-- 实时命令
	use({ "smjonas/live-command.nvim" })

	-- lazygit support
	-- 使用lazygit接口
	use("kdheepak/lazygit.nvim")

	-----------------  markdown  --------------------
	-- markdown preview
	-- markdown自动预览
	use({
		"iamcco/markdown-preview.nvim",
	})

	-- markdown table
	-- 优化markdown添加表格
	-- use("dhruvasagar/vim-table-mode")

	-- nvim-markdown
	-- markdown 增强
	-- use("ixru/nvim-markdown")

	-- markdown flow and enhance
	-- markdown 流程和增强
	use({ "jakewvincent/mkdnflow.nvim" })

	-- orgmode support
	-- orgmode 支持
	use({ "nvim-orgmode/orgmode" })

	-- nvim-tree for file manage
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- vim dashboard
	-- vim 开始界面
	use({ "glepnir/dashboard-nvim" })

	-- smooth neovim scroll
	-- 顺滑的neovim滚动
	use("karb94/neoscroll.nvim")

	-- bufferline on the top
	-- 顶部状态栏
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- 更方便的切换buffer
	-- use({ "matbme/JABS.nvim" })

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	---------------------  file related -------------------------------
	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- telescope-file-browser
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- create new file
	-- 快捷创建新文件
	use("Mohammed-Taher/AdvancedNewFile.nvim")

	-- project
	-- 项目管理
	use({
		"ahmedkhalf/project.nvim",
	})

	-- whick-key
	use({
		"folke/which-key.nvim",
	})

	--------------------- buffer related -----------------

	-- indent-blankline
	-- 竖向加竖线显示对齐
	use({ "lukas-reineke/indent-blankline.nvim" })
	-- comment
	use({
		"numToStr/Comment.nvim",
	})

	-- hop plugin
	-- 快速跳转
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})

	-- lualine for bottom stausline
	-- 底部状态栏
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- notify
	-- 弹窗消息通知
	use({
		"rcarriga/nvim-notify",
	})

	-- autopairs
	-- 自动补全括号
	use({
		"windwp/nvim-autopairs",
	})

	-- coderunner
	-- 代码运行
	use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })

	-- cmake support
	-- cmake 支持
	use("Civitasv/cmake-tools.nvim")

	-------------------   lsp   --------------------------
	-- mason for lsp dap linter and others
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- null-ls for formatter and others
	-- null-ls 用于格式化和其他
	use({
		"jose-elias-alvarez/null-ls.nvim",
	})

	-- 补全引擎
	use("hrsh7th/nvim-cmp")
	-- Snippet 引擎
	use({ "L3MON4D3/LuaSnip" })
	-- use("hrsh7th/vim-vsnip")
	-- 补全源
	-- use("hrsh7th/cmp-vsnip")
	use({ "ray-x/lsp_signature.nvim" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
	-- 常见编程语言代码段
	use("rafamadriz/friendly-snippets")
	-- UI 增强
	use("onsails/lspkind-nvim")
	-- copilot 增强
	use("github/copilot.vim")

	-------------------   dap   -----------------------
	-- dap for neovim
	-- dap ui和适配器
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" } })

	-- persistent breakpoints
	-- 持久化断点
	use({ "Weissle/persistent-breakpoints.nvim" })
end)
