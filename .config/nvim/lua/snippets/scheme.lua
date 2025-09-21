-- [nfnl] fnl/snippets/scheme.fnl
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
return {s("shebang", {t({"#!/usr/bin/guile -s", "; !#"})})}
