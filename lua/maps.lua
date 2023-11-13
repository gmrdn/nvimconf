local keymap = vim.keymap

-- Switch to normal mode
keymap.set('i', 'jk', '<Esc>')
keymap.set('i', 'kj', '<Esc>')
keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'kk', '<Esc>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- -- Do not yank on paste
keymap.set('v', 'p', '\"_dP')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tab split<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Mini Files
keymap.set('n', '<leader>e', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<Return>', { silent = true })
