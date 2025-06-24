require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'moon',
	-- bold_vert_split = false,
	-- dim_nc_background = false,
	-- disable_background = true,
	-- disable_float_background = true,
	-- disable_italics = false,
	--
	--
	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	-- highlight_groups = {
	-- 	ColorColumn = { bg = 'rose' },
	--
	-- 	-- Blend colours against the "base" background
	-- 	CursorLine = { bg = 'foam', blend = 10 },
	-- 	StatusLine = { fg = 'love', bg = 'love', blend = 10 },
	-- }
})

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')
