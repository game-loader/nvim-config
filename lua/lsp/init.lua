local lspconfig = require("lspconfig")

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	lua_ls = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
	clangd = require("lsp.config.clangd"),
	gopls = require("lsp.config.gopls"),
	eslint = require("lsp.config.eslint"),
	-- bashls = require("lsp.config.bash"),
	-- pyright = require("lsp.config.pyright"),
	pylsp = require("lsp.config.pylsp"),
	volar = require("lsp.config.vue"),
	-- jedi_language_server = require("lsp.config.jedi"),
	-- html = require("lsp.config.html"),
	-- cssls = require("lsp.config.css"),
	-- emmet_ls = require("lsp.config.emmet"),
	-- jsonls = require("lsp.config.json"),
	-- tsserver = require("lsp.config.ts"),
	-- rust_analyzer = require("lsp.config.rust"),
	-- yamlls = require("lsp.config.yamlls"),
	-- remark_ls = require("lsp.config.markdown"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		-- 使用默认参数
		lspconfig[name].setup({})
	end
end
