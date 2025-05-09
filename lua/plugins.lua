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
  -- "catppuccin/nvim",
  -- 'folke/tokyonight.nvim',
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
})
