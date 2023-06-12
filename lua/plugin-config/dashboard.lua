-- local db = require("dashboard")
-- db.custom_header = {
-- 	"",
-- 	"┳┻|        ",
-- 	"┻┳|        ",
-- 	"┳┻|ヘ ∧    ",
-- 	"┻┳| ● w ● )",
-- 	"┳┻|⊂ノ     ",
-- 	"┻┳|Ｊ      ",
-- 	"",
-- }
require("dashboard").setup{
  custom_header = {
    "",
    "┳┻|        ",
    "┻┳|        ",
    "┳┻|ヘ ∧    ",
    "┻┳| ● w ● )",
    "┳┻|⊂ノ     ",
    "┻┳|Ｊ      ",
    "",
  },
  custom_section = {
    a = {
      description = { "  Find File          " },
      command = "Telescope find_files find_command=rg,--hidden,--files",
    },
    b = {
      description = { "  Recently Used Files" },
      command = "Telescope oldfiles",
    },
    c = {
      description = { "  Find Word          " },
      command = "Telescope live_grep",
    },
    d = {
      description = { "洛 New File           " },
      command = "DashboardNewFile",
    },
    e = {
      description = { "  Bookmarks          " },
      command = "Telescope marks",
    },
    f = {
      description = { "  Load Last Session  " },
      command = "SessionLoad",
    },
  },
  custom_footer = {
    "Neovim",
  },
}



-- db.custom_center = {
-- 	{
-- 		icon = "  ",
-- 		desc = "Find  File                              ",
-- 		action = "Telescope find_files find_command=rg,--hidden,--files",
-- 		shortcut = "SPC f f",
-- 	},
-- 	{
-- 		icon = "  ",
-- 		desc = "Recently opened files                   ",
-- 		action = "Telescope oldfiles",
-- 		shortcut = "SPC f r",
-- 	},
-- 	{
-- 		icon = "  ",
-- 		desc = "Open  Project                           ",
-- 		action = "Telescope Project                                    ",
-- 		shortcut = "SPC f p",
-- 	},
-- 	{
-- 		icon = "  ",
-- 		desc = "File  Browser                           ",
-- 		action = "Telescope file_browser",
-- 		shortcut = "SPC f b",
-- 	},
-- }
