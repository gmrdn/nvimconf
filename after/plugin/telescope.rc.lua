local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end


telescope.setup {
  defaults = {
    path_display = { "truncate" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
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

telescope.load_extension('fzf')
telescope.load_extension("ui-select")

-- lsp stuff
vim.keymap.set('n', 'gr',
  function() 
    builtin.lsp_references({
      show_line = false,
    })
  end)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ctions' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, {desc = '[C]ode [D]iagnostics'})
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[C]ode [R]ename' })
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinitions' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show [K]ind' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>',
  function()
    builtin.buffers({
      sort_mru = true,
      ignore_current_buffer = true,
    })
  end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>f', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', builtin.git_files, { desc = '[S]earch Git [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

