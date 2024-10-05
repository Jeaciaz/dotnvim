local ok, cc = pcall(require, 'codecompanion')

if not ok then echo 'no codecompanion found' return end

cc.setup {
    adapters = {
        llama3 = function()
            return require'codecompanion.adapters'.extend('ollama', {
                name = 'llama3',
                schema = {
                    model = {
                        default = 'llama3:latest',
                    },
                    num_ctx = {
                        default = 16384,
                    },
                    num_predict = {
                        default = -1,
                    },
                },
            })
        end,
    },
    strategies = {
        chat = { adapter = 'llama3' },
        inline = { adapter = 'llama3' },
        agent = { adapter = 'llama3' },
        default_prompts = { adapter = 'llama3' },
    }
}

vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
