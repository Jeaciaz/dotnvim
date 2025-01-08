local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Get Lazy if not installed
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require'lazy'.setup({
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'}
    }, -- statusline
    'williamboman/mason.nvim', -- LSP & formatter installer
    'williamboman/mason-lspconfig.nvim', -- Mason integration with lspconfig
    'neovim/nvim-lspconfig', -- Streamline LSP setup
    'stevearc/conform.nvim', -- Formatter engine
    'saecki/live-rename.nvim', -- Rename using LSP but interactively & pretty
    {'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp'}, -- snippet engine
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-context', -- context of current line on top of window
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
            keymap = {preset = 'super-tab'},
            sources = {default = {'lsp', 'path', 'snippets', 'buffer'}},
            completion = {
                documentation = {auto_show = true, auto_show_delay_ms = 200},
                ghost_text = {enabled = true}
            },
            signature = {enabled = true}
        }
    }, -- autocomplete
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {},
        keys = {
            {
                '<C-s>',
                mode = {'n', 'x', 'o'},
                function() require'flash'.treesitter() end,
                desc = 'Flash treesitter'
            }
        }
    }, -- jumping around
    'windwp/nvim-ts-autotag', -- autoclose tags
    {'windwp/nvim-autopairs', event = 'InsertEnter', config = true},

    'kyazdani42/nvim-web-devicons', -- icons 
    'nvimdev/lspsaga.nvim', -- LSP hover/diagnostics
    'marilari88/twoslash-queries.nvim', -- // ?^ queries
    'ctrlpvim/ctrlp.vim', -- look up file by name 
    {'rose-pine/neovim', name = 'rose-pine'}, -- theme
    {'rolv-apneseth/tfm.nvim', options = {replace_netrw = true}}, -- Terminal File Manager
    'numToStr/Comment.nvim', -- comment engine
    'JoosepAlviste/nvim-ts-context-commentstring', -- helps comment engine be aware of context (e.g. JSX)

    'Wansmer/sibling-swap.nvim', -- AST sibling manipulation
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, -- telescope
    {'folke/todo-comments.nvim', dependencies = {'nvim-lua/plenary.nvim'}}, -- TODO comments
    {'mistricky/codesnap.nvim', build = 'make'},
    {'akinsho/git-conflict.nvim', version = '*', config = true}, -- solving git conflicts
    {
        'f-person/git-blame.nvim',
        opts = {
            enabled = true,
            message_template = '<date> • <author>',
            date_format = '%d.%m.%y'
        }
    } -- git blame in virtual text
})
