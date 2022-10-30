require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	-- 更改回车为进入目录
	on_attach = function(bufnr)
		local cd = require("nvim-tree.config").nvim_tree_callback("cd")
		vim.keymap.set("n", "<CR>", cd, { buffer = bufnr, noremap = true })
	end,

	update_focused_file = {
		enable = true,
		update_root = true,
	},
})
