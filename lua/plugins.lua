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
  'navarasu/onedark.nvim',
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
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
  },

  -- 'nvim-lualine/lualine.nvim', -- Statusline
  'nvim-lua/plenary.nvim', -- Common utilities
  'onsails/lspkind-nvim', -- vscode-like pictograms

  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  { 'echasnovski/mini.nvim', version = false },


  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'eandrju/cellular-automaton.nvim',
  'L3MON4D3/LuaSnip',
  'nvim-treesitter/nvim-treesitter',
  -- 'nvim-treesitter/nvim-treesitter-context',
  'kyazdani42/nvim-web-devicons', -- File icons
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  "nvim-telescope/telescope-fzf-native.nvim",
  {'nvim-telescope/telescope-ui-select.nvim' },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'norcalli/nvim-colorizer.lua',
  'github/copilot.vim',

  -- 'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim', -- For git blame & browse
  'numToStr/Comment.nvim',
  "kylechui/nvim-surround",

  -- Helm
  'towolf/vim-helm',

  -- Go
  'ray-x/go.nvim',
  'ray-x/guihua.lua', -- recommanded if need floating window support
})
