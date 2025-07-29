local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

return {
    "nvim-telescope/telescope.nvim",
    config = function()
        require("telescope").setup {
            defaults = {
                -- initial_mode = "normal",
                path_display = { "truncate" },
                mappings = {
                    n = {
                        ["q"] = actions.close
                    },
                },
                layout_strategy = "horizontal",
            },
            pickers = {
                buffers = {
                    theme = "ivy",
                    ignore_current_buffer = true,
                    sort_mru = true,
                    previewer = true,
                },
                lsp_references = {
                    theme = "ivy",
                    previewer = true,
                    layout_config = {
                        width = 0.65,
                        height = 0.65,
                    },
                },
                lsp_implementations = {
                    theme = "cursor",
                    previewer = false,
                    layout_config = {
                        width = 0.65,
                        height = 0.65,
                    },
                },
                diagnostics = {
                    theme = "ivy",
                    previewer = false,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                    })
                },
            },
        }
    end,


    keys = {
        {'<leader>ca', vim.lsp.buf.code_action,  desc = '[C]ode [A]ctions' },
        {'<leader>cd', vim.diagnostic.open_float, desc = '[C]ode [D]iagnostics'},
        {'<leader>cr', vim.lsp.buf.rename,  desc = '[C]ode [R]ename' },
        {'K', vim.lsp.buf.hover,  desc = 'Show [K]ind' },
        {'<leader>f', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end,  desc = '[/] Fuzzily search in current buffer' },
        { '<leader>?', builtin.oldfiles,  desc = '[?] Find recently opened files' },
        { '<leader>gs', builtin.git_status,  desc = '[G]it [S]tatus' },
        { '<leader>sh', builtin.help_tags,  desc = '[S]earch [H]elp' },
        { '<leader>sw', builtin.grep_string,  desc = '[S]earch current [W]ord' },
        { '<leader>sd', builtin.diagnostics, desc = '[S]earch [D]iagnostics' }
    }
}
