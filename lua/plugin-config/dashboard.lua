local db = require("dashboard")
db.custom_header = {
	"",
	"┳┻|        ",
	"┻┳|        ",
	"┳┻|ヘ ∧    ",
	"┻┳| ● w ● )",
	"┳┻|⊂ノ     ",
	"┻┳|Ｊ      ",
	"",
}

db.custom_center = {
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "      f",
	},
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "Telescope oldfiles",
		shortcut = "SPC f r",
	},
	{
		icon = "  ",
		desc = "Open  Project                           ",
		action = "Telescope Project                                    ",
		shortcut = "SPC f p",
	},
	{
		icon = "  ",
		desc = "File  Browser                           ",
		action = "Telescope file_browser",
		shortcut = "SPC f f",
	},
}
