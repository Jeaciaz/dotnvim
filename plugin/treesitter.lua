local ok, ts = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

ts.setup {
    highlight = {enable = true, disable = {}},
    indent = {enable = true, disable = {}},
    ensure_installed = {
        "markdown", "markdown_inline", "lua", "javascript", "tsx", "json",
        "yaml", "css", "html"
    },
    autotag = {enable = true},
    context_commentstring = {
        config = {
            javascript = {
                __default = '// %s',
                jsx_element = '{/* %s */}',
                jsx_fragment = '{/* %s */}',
                jsx_attribute = '// %s',
                comment = '// %s'
            },
            typescript = {__default = '// %s', __multiline = '/* %s */'}
        }
    },
    refactor = {highlight_definitions = {enable = true}}
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.filetype_to_parsername = {'javascript', 'typescript.tsx'}

require'treesitter-context'.setup {
    enable = true,
    separator = '~' -- Ξ
}
