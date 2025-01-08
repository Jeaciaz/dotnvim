local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local rep = require("luasnip.extras").rep

ls.add_snippets("typescriptreact", {
  s("comp", {
    t({ "type " }), i(1, "Component"), t("Props = {"),
    t({ "", "};", "", "" }),
    t("export const "), rep(1), t(" = ({}: "), rep(1), t("Props) => {"),
    t({ "", "  " }),
    t({ "", "};" }),
  }),
})
