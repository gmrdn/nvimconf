local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end


telescope.setup {
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

-- telescope.load_extension('fzf')
telescope.load_extension("ui-select")
telescope.load_extension("live_grep_args")

-- lsp stuff
-- vim.keymap.set('n', 'gr',
--   function() 
--     builtin.lsp_references({
--       show_line = false,
--     })
--   end)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ctions' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, {desc = '[C]ode [D]iagnostics'})
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[C]ode [R]ename' })
-- vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinitions' })
-- vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = '[G]oto [I]mplementations' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show [K]ind' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', builtin.buffers,  { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>f', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- git modified files
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

