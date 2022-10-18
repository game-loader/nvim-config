require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.3
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<C-\>]],
	insert_mapping = true,
	start_in_insert = true,
	autochdir = true,
	auto_scroll = false, -- automatically scroll to the bottom on terminal output
	direction = "horizontal",
})
