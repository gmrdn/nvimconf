local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "catppuccin/nvim",
  'folke/tokyonight.nvim',
  -- 'navarasu/onedark.nvim',
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  'ramojus/mellifluous.nvim',
  -- 'EdenEast/nightfox.nvim',
  'sainnhe/gruvbox-material',
  -- 'sainnhe/edge',
  'rose-pine/neovim',
  "rebelot/kanagawa.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  "neanias/everforest-nvim",
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- "savq/melange-nvim",
  -- {
  --   'maxmx03/solarized.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = 'light' -- or 'light'
  --
  --     -- vim.cmd.colorscheme 'solarized'
  --   end,
  -- },
  "jake-stewart/multicursor.nvim",
  'nvim-lualine/lualine.nvim', -- Statusline
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  'nvim-lua/plenary.nvim', -- Common utilities
  'onsails/lspkind-nvim', -- vscode-like pictograms
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  {'neovim/nvim-lspconfig', dependencies={'saghen/blink.cmp' }},
  -- 'hrsh7th/cmp-nvim-lsp',
  -- 'hrsh7th/cmp-buffer',
  -- 'hrsh7th/cmp-path',
  -- 'hrsh7th/cmp-cmdline',
  -- 'hrsh7th/nvim-cmp',
  {'saghen/blink.cmp', dependencies = { 'rafamadriz/friendly-snippets' }, version = '*'},
  { 'echasnovski/mini.nvim', version = false },

  {'williamboman/mason.nvim', version="1.11.0" },
  {'williamboman/mason-lspconfig.nvim', version="1.32.0"},
  'eandrju/cellular-automaton.nvim',
  'L3MON4D3/LuaSnip',
  'nvim-treesitter/nvim-treesitter',
  -- 'nvim-treesitter/nvim-treesitter-context',
  'kyazdani42/nvim-web-devicons', -- File icons
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { 
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        version = "^1.0.0",
      },
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-file-browser.nvim',
  {'nvim-telescope/telescope-ui-select.nvim' },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'norcalli/nvim-colorizer.lua',
  'github/copilot.vim',
  {
    'stevearc/conform.nvim',
    opts = {},
  },

  -- git stuff
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim', -- For git blame & browse
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  'numToStr/Comment.nvim',
  "kylechui/nvim-surround",

  -- Helm
  'towolf/vim-helm',

  -- Go
  'ray-x/go.nvim',
  'ray-x/guihua.lua', -- recommanded if need floating window support


  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        }
      }
    },
    keys = {
      -- Top Pickers & Explorer
      -- { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader><space>", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    --   { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    --   { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>E", function() Snacks.explorer() end, desc = "File Explorer" },
    --   -- find
    --   { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>sf", function() Snacks.picker.files() end, desc = "Find Files" },
    --   { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    --   { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    --   { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    --   -- git
    --   { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    --   { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    --   { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    --   { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    --   { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    --   { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    --   { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    --   -- Grep
    --   { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    --   { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    --   { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    --   { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    --   -- search
    --   { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    --   { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    --   { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    --   { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    --   { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    --   { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    --   { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    --   { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    --   { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    --   { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    --   { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    --   { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    --   { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    --   { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    --   { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    --   { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    --   { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    --   { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    --   { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    --   { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    --   { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    --   -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },

      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    --   -- Other
    --   { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    --   { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    --   { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    --   { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    --   { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    --   { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    --   { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    --   { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    --   { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    --   { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    --   { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    --   { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    --   { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    --   { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    --   {
    --     "<leader>N",
    --     desc = "Neovim News",
    --     function()
    --       Snacks.win({
    --         file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    --         width = 0.6,
    --         height = 0.6,
    --         wo = {
    --           spell = false,
    --           wrap = false,
    --           signcolumn = "yes",
    --           statuscolumn = " ",
    --           conceallevel = 3,
    --         },
    --       })
    --     end,
    --   }
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  }
})
