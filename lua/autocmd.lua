local vim = vim
local api = vim.api
local M = {}
-- function to create a list of commands and convert them to autocommands

function M.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		api.nvim_command("augroup " .. group_name)
		api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			api.nvim_command(command)
		end
		api.nvim_command("augroup END")
	end
end

function set_colorscheme()
	local colorschemes = vim.fn.getcompletion("", "color")
	local desired_colorscheme = "material"

	if vim.tbl_contains(colorschemes, desired_colorscheme) then
		vim.cmd("colorscheme " .. desired_colorscheme)
		vim.g.material_style = "lighter"
	else
		vim.cmd("colorscheme default")
	end
end

function auto_chdir()
	local filename = vim.fn.expand("%:p")
	local directory = vim.fn.fnamemodify(filename, ":h")
	vim.cmd("cd " .. directory)
end

local autoCommands = {
	-- other autocommands
	open_folds = {
		{ "FileReadPost", "*.md", "normal zx" },
	},
	set_colorscheme = {
		{ "VimEnter", "*", "lua set_colorscheme()" },
	},
	auto_change_directory = {
		{ "BufEnter", "*", "lua auto_chdir()" },
	},
}

M.nvim_create_augroups(autoCommands)
