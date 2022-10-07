require("basic").load_default_options()

require("plugins")

require("keybindings")

require("plugin-config/nvim-tree")
require("plugin-config/bufferline")
require("plugin-config/treesitter")
require("plugin-config/telescope")
require("plugin-config/whichkey")
require("plugin-config/comment")
require("plugin-config/mason")
require("plugin-config/lualine")
require("plugin-config/notify")
require("plugin-config/nvim-autopairs")
require("plugin-config/project")
require("plugin-config/dashboard")
require("plugin-config/coderunner")
require("plugin-config/lazygit")
-- require("plugin-config/neogit")

require("lsp")
require("lsp.cmp")
require("lsp.null-ls")

require("nvim-dap")
