require("basic").load_default_options()

require("plugins")

require("keybindings")

-- require("plugin-config/nvim-tree")
require("plugin-config/buffer_line")
require("plugin-config/treesitter")
require("plugin-config/telescope")
require("plugin-config/whichkey")
require("plugin-config/comment")
require("plugin-config/vimtex")
require("plugin-config/mason")
require("plugin-config/lua_line")
require("plugin-config/notify")
require("plugin-config/nvim-autopairs")
require("plugin-config/lua_snip")
require("plugin-config/table-mode")
require("plugin-config/mkdnflow")
require("plugin-config/project")
-- require("plugin-config/alpha")
require("plugin-config/dashboard")
require("plugin-config/hop")
require("plugin-config/neotree")
require("plugin-config/live_command")
require("plugin-config/jaq")
require("plugin-config/toggleterm")
require("plugin-config/indent-blankline")
require("plugin-config/lazygit")

require("autocmd")
require("lsp")
require("lsp.flutter")
require("lsp.cmp")
-- require("lsp.coc")
require("lsp.null-ls")
require("lsp.ui")

require("nvim-dap")
