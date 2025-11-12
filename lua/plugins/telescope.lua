-- local telescope = require("telescope")
-- local actions = require("telescope.actions")
-- local builtin = require('telescope.builtin')

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- keys = {
    --     { '<leader>ca', vim.lsp.buf.code_action,   desc = '[C]ode [A]ctions' },
    --     { '<leader>cd', vim.diagnostic.open_float, desc = '[C]ode [D]iagnostics' },
    --     { '<leader>cr', vim.lsp.buf.rename,        desc = '[C]ode [R]ename' },
    --     { 'K',          vim.lsp.buf.hover,         desc = 'Show [K]ind' },
    --     {
    --         '<leader>f',
    --         function()
    --             -- You can pass additional configuration to telescope to change theme, layout, etc.
    --             builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --                 winblend = 10,
    --                 previewer = false,
    --             })
    --         end,
    --         desc = '[/] Fuzzily search in current buffer'
    --     },
    --     { '<leader>?',  builtin.oldfiles,    desc = '[?] Find recently opened files' },
    --     { '<leader>gs', builtin.git_status,  desc = '[G]it [S]tatus' },
    --     { '<leader>sh', builtin.help_tags,   desc = '[S]earch [H]elp' },
    --     { '<leader>sw', builtin.grep_string, desc = '[S]earch current [W]ord' },
    --     { '<leader>sd', builtin.diagnostics, desc = '[S]earch [D]iagnostics' }
    -- }
}
