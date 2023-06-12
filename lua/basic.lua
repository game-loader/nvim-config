local M = {}

M.load_default_options = function()
	local set_options = {
		backup = false, -- creates a backup file
		clipboard = "unnamed", -- allows neovim to access the system clipboard
		cmdheight = 1, -- more space in the neovim command line for displaying messages
		completeopt = { "menuone", "noselect" },
		conceallevel = 0, -- so that `` is visible in markdown files
		fileencoding = "utf-8", -- the encoding written to a file
		fileencodings = "utf-8,cp936,gb18030,big5",
		guifont = "FiraCode Nerd Font:h20", -- the font used in graphical neovim applications
		background = "light", -- set the background to light or dark
		hidden = true, -- required to keep multiple buffers and open multiple buffers
		hlsearch = true, -- highlight all matches on previous search pattern
		ignorecase = true, -- ignore case in search patterns
		mouse = "a", -- allow the mouse to be used in neovim
		pumheight = 10, -- pop up menu height
		showmode = false, -- we don't need to see things like -- INSERT -- anymore
		showtabline = 2, -- always show tabs
		smartcase = true, -- smart case
		smartindent = true, -- make indenting smarter again
		splitbelow = true, -- force all horizontal splits to go below current window
		splitright = true, -- force all vertical splits to go to the right of current window
		swapfile = false, -- creates a swapfile
		autochdir = true, -- auto change working directory
		termguicolors = true, -- set term gui colors (most terminals support this)
		timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
		-- foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
		-- foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
		foldenable = true,
		foldlevel = 99,
		title = true, -- set the title of window to the value of the titlestring
		-- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
		-- undodir = undodir, -- set an undo directory
		undofile = true, -- enable persistent undo
		updatetime = 100, -- faster completion
		writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
		expandtab = true, -- convert tabs to spaces
		shiftwidth = 2, -- the number of spaces inserted for each indentation
		tabstop = 2, -- insert 2 spaces for a tab
		cursorline = true, -- highlight the current line
		number = true, -- set numbered lines
		numberwidth = 4, -- set number column width to 2 {default 4}
		relativenumber = true, -- set relative numbered lines
		signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
		wrap = true, -- display lines as one long line
		-- shadafile = join_paths(get_cache_dir(), "lvim.shada"),
		scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
		sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.
		showcmd = false,
		ruler = false,
		laststatus = 3,
	}

	for k, v in pairs(set_options) do
		vim.opt[k] = v
	end

	local let_options = {
		-- disable netrw at the very start of your init.lua (strongly advised)
		loaded = 1,
		loaded_netrwPlugin = 1,
		-- set leaderkey to space
		mapleader = " ",
		maplocalleader = "\\",
		copilot_node_command = "~/.nodenv/versions/16.17.0/bin/node",
	}

	for k, v in pairs(let_options) do
		vim.g[k] = v
	end
end

return M
