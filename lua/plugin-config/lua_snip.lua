local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

local date = function()
	return { os.date("%Y-%m-%d") }
end

ls.add_snippets("all", {
	s({
		trig = "date",
		name = "Date",
		dscr = "Date in the form of YYYY-MM-DD",
	}, {
		f(date, {}),
	}),
})

ls.add_snippets("markdown", {
	s({ trig = "meta", name = "Metadata", dscr = "Yaml metadata format for markdown" }, {
		t({ "---", "title: " }),
		i(1, "note_title"),
		t({ "", "author: " }),
		i(2, "Logic"),
		t({ "", "date: " }),
		f(date, {}),
		t({ "", 'categories: ["' }),
		i(3, ""),
		t({ '"]', "tags: [" }),
		i(4),
		t({ "]", "draft: " }),
		i(5, "false"),
		t({ "", "", "---", "" }),
		i(0),
	}),
})

ls.add_snippets("tex", {
	s("usepackage", {
		t("\\usepackage{"),
		i(1),
		t("}"),
	}),
	s("begin", {
		t("\\begin{"),
		i(1, "enumerate"),
		t("}"),
		t({ "", "" }),
		i(2, "(content)"),
		t({ "", "\\end{" }),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("}"),
	}),
})

require("luasnip.loaders.from_lua").lazy_load({ include = { "all", "markdown", "tex" } })
