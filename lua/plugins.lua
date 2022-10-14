return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

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

	use({
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({ style = "darker" })
			require("onedark").load()
		end,
	})

	-- a good terminal
	-- 一个好的nvim内终端
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- git plugin like magit
	-- 类似magit的插件neogit
	-- use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

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
	use("dhruvasagar/vim-table-mode")

	-- nvim-tree for file manage
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- vim dashboard
	-- vim 开始界面
	use({ "glepnir/dashboard-nvim" })

	-- bufferline on the top
	-- 顶部状态栏
	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- 更方便的切换buffer
	use({ "matbme/JABS.nvim" })

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

	-- project
	-- 项目管理
	use({
		"ahmedkhalf/project.nvim",
	})

	-- whick-key
	use({
		"folke/which-key.nvim",
	})

	-- comment
	use({
		"numToStr/Comment.nvim",
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

	-- nlsp-settings
	-- 方便的lsp配置插件
	-- use {
	--   "tamago324/nlsp-settings.nvim"
	-- }

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

	-------------------   dap   -----------------------
	-- dap for neovim
	-- dap ui和适配器
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" } })
end)
