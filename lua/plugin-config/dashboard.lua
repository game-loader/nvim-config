local db = require("dashboard")
local function foot()
	-- local total_plugins = #vim.tbl_keys(packer_plugins)
	local function get_table_size(t)
		local count = 0
		for _, __ in pairs(t) do
			count = count + 1
		end
		return count
	end

	local opt, start = require("packer.plugin_utils").list_installed_plugins()
	local plugin_count = get_table_size(opt) + get_table_size(start)
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return datetime .. "   " .. plugin_count .. " plugins" .. nvim_version_info
end

db.setup({
	theme = "doom",
	config = {
		header = {
			"                :*+++++********++=-:.   ",
			"                #-                  =+*+",
			"               .%                      %",
			"               ++                     .#",
			"              -#                      #.",
			"              *=                     :# ",
			"             .%.                     *- ",
			"             +*                     .%  ",
			"             %-                     ==  ",
			"            -@++++++++++======----::#.  ",
			"            *-          .....::::--**   ",
			"           .%                      %=   ",
			"           ++                     =%:   ",
			"  .+++**+++%%##########%%%%%%%%%%%%%***-",
			"     .+ .*           -+ ..:=+*%%%%%.    ",
			"     +: :+           *:        :+%*     ",
			"     %   *.        .+-           *:     ",
			"    =+    %==-::-===.        .-=+*      ",
			"   :%=    #.  ..      .:--=+-:+:+       ",
			"  +%%%=    +*---+----:*    = :+:        ",
			"=%%%%%%=    .==-*.   .*:---=:.     .... ",
			"                                        ",
		},
		center = {
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Find File           ",
				desc_hl = "String",
				key = "b",
				keymap = "SPC f f",
				key_hl = "Number",
				action = "Telescope find_files find_command=rg,--hidden,--files",
			},
			{
				icon = " ",
				desc = "Recently opened files                   ",
				desc_hl = "String",
				key = "a",
				keymap = "SPC f r",
				key_hl = "Number",
				action = "Telescope oldfiles",
			},
			{
				icon = " ",
				desc = "Open  Project                           ",
				desc_hl = "String",
				key = "c",
				keymap = "SPC f p",
				key_hl = "Number",
				action = "Telescope Project                                    ",
			},
			{
				icon = " ",
				desc = "File  Browser                           ",
				desc_hl = "String",
				key = "d",
				keymap = "SPC f b",
				key_hl = "Number",
				action = "Telescope file_browser",
			},
		},
		footer = { foot() }, --your footer
	},
})
